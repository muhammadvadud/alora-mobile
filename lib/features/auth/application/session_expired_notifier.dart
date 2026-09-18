import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_expired_notifier.g.dart';

/// Sessiya muddati tugaganligi haqidagi signal (sanoq).
/// UI qatlami (GlobalListeners) shu o'zgarishni tinglab snackbar ko'rsatadi.
@Riverpod(keepAlive: true)
class SessionExpiredNotifier extends _$SessionExpiredNotifier {
  @override
  int build() => 0;

  void trigger() {
    state = state + 1;
  }
}
