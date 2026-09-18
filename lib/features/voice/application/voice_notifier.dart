import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutter/widgets.dart';

import 'dart:async';

import 'audio_recorder.dart';
import 'audio_player.dart';
import 'vad.dart';

part 'voice_notifier.freezed.dart';
part 'voice_notifier.g.dart';

enum VoiceMode { pushToTalk, freeConversation }

@freezed
class VoiceState with _$VoiceState {
  const factory VoiceState.idle() = _Idle;
  const factory VoiceState.listening({
    @Default(0.0) double amplitude,
    @Default(Duration.zero) Duration duration,
  }) = _Listening;
  const factory VoiceState.transcribing() = _Transcribing;
  const factory VoiceState.speaking({@Default(0.0) double amplitude}) =
      _Speaking;
  const factory VoiceState.error(String message) = _Error;
}

@riverpod
class VoiceNotifier extends _$VoiceNotifier with WidgetsBindingObserver {
  late final AppAudioRecorder _recorder;
  late final AppAudioPlayer _player;
  late final Vad _vad;

  VoiceMode _mode = VoiceMode.freeConversation;
  bool _isMuted = false;

  StreamSubscription<double>? _amplitudeSub;
  Timer? _durationTimer;
  DateTime? _recordingStartTime;

  @override
  VoiceState build() {
    _recorder = ref.watch(audioRecorderProvider);
    _player = ref.watch(audioPlayerProvider);
    _vad = Vad(onSpeechStart: _onSpeechStart, onSpeechEnd: _onSpeechEnd);

    WidgetsBinding.instance.addObserver(this);

    ref.onDispose(() {
      WidgetsBinding.instance.removeObserver(this);
      _cleanup();
      _vad.dispose();
    });

    return const VoiceState.idle();
  }

  void toggleMode(VoiceMode mode) {
    _mode = mode;
  }

  void toggleMute(bool muted) {
    _isMuted = muted;
    if (_isMuted && state is _Speaking) {
      _player.stopPlaying();
    }
  }

  Future<void> startListening() async {
    if (state is _Listening) return;

    // Stop any ongoing speech playback (barge-in)
    if (state is _Speaking) {
      await _player.stopPlaying();
    }

    await _setupAudioSession();
    await WakelockPlus.enable();

    await _recorder.startRecording();
    _recordingStartTime = DateTime.now();
    _vad.reset();

    _amplitudeSub = _recorder.amplitudeStream.listen((amp) {
      _vad.processAmplitude(amp);
      if (state is _Listening) {
        state = VoiceState.listening(
          amplitude: amp,
          duration: DateTime.now().difference(_recordingStartTime!),
        );
      }
    });

    _durationTimer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (state is _Listening) {
        state = VoiceState.listening(
          amplitude: (state as _Listening).amplitude,
          duration: DateTime.now().difference(_recordingStartTime!),
        );
      }
    });

    state = const VoiceState.listening();
  }

  void _onSpeechStart() {
    // For barge-in, we could stop playing here if we are playing and listening simultaneously.
    if (state is _Speaking) {
      _player.stopPlaying();
    }
  }

  Future<void> _onSpeechEnd() async {
    if (_mode == VoiceMode.freeConversation && state is _Listening) {
      await stopListening();
    }
  }

  Future<void> stopListening() async {
    if (state is! _Listening) return;

    await _recorder.stopRecording();
    _cleanup();

    state = const VoiceState.transcribing();

    // Backend bloker: haqiqiy WebSocket yozish/o'qish yo'q, shuning uchun
    // mock ishlatiladi.
    Future.delayed(const Duration(seconds: 1), () {
      if (_isMuted) {
        state = const VoiceState.idle();
        unawaited(_disableWakelock());
      } else {
        unawaited(startSpeaking());
      }
    });
  }

  Future<void> startSpeaking() async {
    state = const VoiceState.speaking();
    await _player.startPlaying();
    // In real app, we'd feed chunks to _player.addAudioChunk()

    // Simulate end of speaking
    Future.delayed(const Duration(seconds: 2), () {
      if (state is _Speaking) {
        unawaited(stopSpeaking());
      }
    });
  }

  Future<void> stopSpeaking() async {
    await _player.stopPlaying();
    state = const VoiceState.idle();
    await _disableWakelock();
  }

  void interrupt() {
    if (state is _Speaking) {
      _player.stopPlaying();
      state = const VoiceState.idle();
      unawaited(_disableWakelock());
    }
  }

  void _cleanup() {
    _amplitudeSub?.cancel();
    _durationTimer?.cancel();
  }

  Future<void> _disableWakelock() async {
    if (await WakelockPlus.enabled) {
      await WakelockPlus.disable();
    }
  }

  Future<void> _setupAudioSession() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    session.interruptionEventStream.listen((event) {
      if (event.begin) {
        _handleInterruption();
      }
    });
  }

  void _handleInterruption() {
    if (state is _Listening) {
      unawaited(stopListening());
    } else if (state is _Speaking) {
      unawaited(stopSpeaking());
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _handleInterruption();
    }
  }
}
