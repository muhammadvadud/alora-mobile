import 'dart:async';
import 'dart:typed_data';

import 'package:record/record.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final audioRecorderProvider = Provider<AppAudioRecorder>((ref) {
  final recorder = AppAudioRecorder();
  ref.onDispose(() => recorder.dispose());
  return recorder;
});

class AppAudioRecorder {
  final AudioRecorder _recorder = AudioRecorder();
  StreamSubscription<RecordState>? _recordStateSubscription;

  Stream<Uint8List>? _audioStream;
  StreamSubscription<Uint8List>? _audioStreamSubscription;
  final StreamController<Uint8List> _chunkController =
      StreamController<Uint8List>.broadcast();
  final StreamController<double> _amplitudeController =
      StreamController<double>.broadcast();

  Timer? _amplitudeTimer;

  AppAudioRecorder() {
    _recordStateSubscription = _recorder.onStateChanged().listen((state) {
      if (state == RecordState.stop) {
        _cleanup();
      }
    });
  }

  Stream<Uint8List> get audioStream => _chunkController.stream;
  Stream<double> get amplitudeStream => _amplitudeController.stream;

  Future<void> startRecording() async {
    if (await _recorder.hasPermission()) {
      _audioStream = await _recorder.startStream(
        const RecordConfig(
          encoder: AudioEncoder.pcm16bits,
          sampleRate: 16000,
          numChannels: 1,
        ),
      );

      _audioStreamSubscription = _audioStream?.listen((data) {
        _chunkController.add(data);
      });

      // Provide amplitude updates at roughly 200ms intervals
      _amplitudeTimer = Timer.periodic(const Duration(milliseconds: 200), (
        _,
      ) async {
        if (await _recorder.isRecording()) {
          final amplitude = await _recorder.getAmplitude();
          // Map amplitude (which is roughly -160 to 0 dB) to 0.0 - 1.0
          // Assume -60 is silence, 0 is max
          double normalized = (amplitude.current + 60) / 60;
          normalized = normalized.clamp(0.0, 1.0);
          _amplitudeController.add(normalized);
        }
      });
    }
  }

  Future<void> stopRecording() async {
    await _recorder.stop();
    _cleanup();
  }

  void _cleanup() {
    _audioStreamSubscription?.cancel();
    _amplitudeTimer?.cancel();
  }

  void dispose() {
    _cleanup();
    _recordStateSubscription?.cancel();
    _chunkController.close();
    _amplitudeController.close();
    _recorder.dispose();
  }
}
