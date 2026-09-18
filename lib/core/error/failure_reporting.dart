import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'error_reporter.dart';
import 'failure.dart';

/// `Failure` ni kuzatuvga yuboradi: har doim breadcrumb; server tomonidagi
/// xatolar (`server`, `serviceUnavailable`, `unknown`) qo'shimcha exception sifatida.
/// Tarmoq/auth/validation/limit — foydalanuvchi holati, exception emas.
void reportFailure(Ref ref, Failure failure) {
  final reporter = ref.read(errorReporterProvider);
  reporter.breadcrumb(failure);
  final isServerSide = failure.maybeWhen(
    server: () => true,
    serviceUnavailable: () => true,
    unknown: (_) => true,
    orElse: () => false,
  );
  if (isServerSide) reporter.captureException(failure);
}
