import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_events.g.dart';

/// Tarmoq qatlamidan (RefreshInterceptor) auth qatlamiga "sessiya tugadi" signali.
/// Interceptor tokenlarni o'chirganda auth holati buni bilmas edi — ilova
/// "kirgan" ko'rinishda qolib, har so'rov 401 bo'lardi (logout bo'lmasdi).
class SessionEvents {
  final StreamController<void> _expired = StreamController<void>.broadcast();

  Stream<void> get onExpired => _expired.stream;

  void expire() {
    if (!_expired.isClosed) _expired.add(null);
  }

  void dispose() => _expired.close();
}

@Riverpod(keepAlive: true)
SessionEvents sessionEvents(Ref ref) {
  final events = SessionEvents();
  ref.onDispose(events.dispose);
  return events;
}
