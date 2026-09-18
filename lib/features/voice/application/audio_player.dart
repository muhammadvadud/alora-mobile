// ignore_for_file: experimental_member_use

import 'dart:async';
import 'dart:typed_data';

import 'package:just_audio/just_audio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final audioPlayerProvider = Provider<AppAudioPlayer>((ref) {
  final player = AppAudioPlayer();
  ref.onDispose(() => player.dispose());
  return player;
});

class RawStreamAudioSource extends StreamAudioSource {
  final Stream<List<int>> stream;
  final int sampleRate;
  final int numChannels;

  RawStreamAudioSource({
    required this.stream,
    this.sampleRate = 16000,
    this.numChannels = 1,
  });

  @override
  Future<StreamAudioResponse> request([int? start, int? end]) async {
    // Generate a simple WAV header for PCM16 audio
    // Note: just_audio might need length in WAV header, but we stream it.
    // However, just_audio can play stream without length if we set Content-Type correctly,
    // or we can stream raw PCM. Actually, just_audio supports just returning the stream.
    // For raw PCM, we usually have to wrap it in a WAV header with unknown length, or just pass audio/wav.
    return StreamAudioResponse(
      sourceLength: null,
      contentLength: null,
      offset: start ?? 0,
      stream: stream,
      contentType: 'audio/wav',
    );
  }
}

class AppAudioPlayer {
  final AudioPlayer _player = AudioPlayer();
  StreamController<List<int>>? _chunkController;
  bool _isPlaying = false;

  // WAV header generator
  List<int> _createWavHeader({
    required int sampleRate,
    required int numChannels,
  }) {
    final byteRate = sampleRate * numChannels * 2;
    final blockAlign = numChannels * 2;

    final header = ByteData(44);
    // "RIFF"
    header.setUint8(0, 82);
    header.setUint8(1, 73);
    header.setUint8(2, 70);
    header.setUint8(3, 70);
    // ChunkSize (0xFFFFFFFF for unknown)
    header.setUint32(4, 0xFFFFFFFF, Endian.little);
    // "WAVE"
    header.setUint8(8, 87);
    header.setUint8(9, 65);
    header.setUint8(10, 86);
    header.setUint8(11, 69);
    // "fmt "
    header.setUint8(12, 102);
    header.setUint8(13, 109);
    header.setUint8(14, 116);
    header.setUint8(15, 32);
    // Subchunk1Size (16 for PCM)
    header.setUint32(16, 16, Endian.little);
    // AudioFormat (1 for PCM)
    header.setUint16(20, 1, Endian.little);
    // NumChannels
    header.setUint16(22, numChannels, Endian.little);
    // SampleRate
    header.setUint32(24, sampleRate, Endian.little);
    // ByteRate
    header.setUint32(28, byteRate, Endian.little);
    // BlockAlign
    header.setUint16(32, blockAlign, Endian.little);
    // BitsPerSample
    header.setUint16(34, 16, Endian.little);
    // "data"
    header.setUint8(36, 100);
    header.setUint8(37, 97);
    header.setUint8(38, 116);
    header.setUint8(39, 97);
    // Subchunk2Size (0xFFFFFFFF for unknown)
    header.setUint32(40, 0xFFFFFFFF, Endian.little);

    return header.buffer.asUint8List();
  }

  Future<void> startPlaying() async {
    if (_isPlaying) {
      await stopPlaying();
    }

    _chunkController = StreamController<List<int>>();
    _isPlaying = true;

    // Add WAV header so just_audio can decode it
    _chunkController!.add(_createWavHeader(sampleRate: 16000, numChannels: 1));

    final source = RawStreamAudioSource(stream: _chunkController!.stream);

    // We don't await player.play() because it completes when audio finishes.
    await _player.setAudioSource(source);
    unawaited(_player.play());
  }

  void addAudioChunk(List<int> chunk) {
    if (_isPlaying && _chunkController != null && !_chunkController!.isClosed) {
      _chunkController!.add(chunk);
    }
  }

  Future<void> stopPlaying() async {
    if (!_isPlaying) return;
    _isPlaying = false;
    await _player.stop();
    await _chunkController?.close();
    _chunkController = null;
  }

  void dispose() {
    _chunkController?.close();
    _player.dispose();
  }
}
