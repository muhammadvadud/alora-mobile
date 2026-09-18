import 'dart:async';

class Vad {
  // Simple energy based VAD
  static const double _speechThreshold = 0.05; // 5% amplitude
  static const Duration _silenceThreshold = Duration(milliseconds: 1200);

  bool _isSpeaking = false;
  DateTime? _lastSpeechTime;
  Timer? _silenceTimer;

  final void Function() onSpeechStart;
  final void Function() onSpeechEnd;

  Vad({required this.onSpeechStart, required this.onSpeechEnd});

  void processAmplitude(double amplitude) {
    if (amplitude > _speechThreshold) {
      if (!_isSpeaking) {
        _isSpeaking = true;
        onSpeechStart();
      }
      _lastSpeechTime = DateTime.now();
      _silenceTimer?.cancel();
    } else {
      if (_isSpeaking) {
        if (_lastSpeechTime != null) {
          final timeSinceLastSpeech = DateTime.now().difference(
            _lastSpeechTime!,
          );
          if (timeSinceLastSpeech >= _silenceThreshold) {
            _triggerSpeechEnd();
          } else {
            // Start or reset timer
            _silenceTimer?.cancel();
            _silenceTimer = Timer(
              _silenceThreshold - timeSinceLastSpeech,
              _triggerSpeechEnd,
            );
          }
        }
      }
    }
  }

  void _triggerSpeechEnd() {
    if (_isSpeaking) {
      _isSpeaking = false;
      _silenceTimer?.cancel();
      onSpeechEnd();
    }
  }

  void reset() {
    _isSpeaking = false;
    _lastSpeechTime = null;
    _silenceTimer?.cancel();
  }

  void dispose() {
    _silenceTimer?.cancel();
  }
}
