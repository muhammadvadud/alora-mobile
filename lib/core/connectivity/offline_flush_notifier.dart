import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offline_flush_notifier.g.dart';

/// Offline navbatni yuborishda muvaffaqiyatsiz bo'lgan amallar xabarlari.
/// UI qatlami (GlobalListeners) shu xabarlarni tinglab snackbar ko'rsatadi.
@Riverpod(keepAlive: true)
class OfflineFlushMessages extends _$OfflineFlushMessages {
  @override
  List<String> build() => const [];

  void add(String message) {
    state = [...state, message];
  }

  void clear() {
    state = const [];
  }
}
