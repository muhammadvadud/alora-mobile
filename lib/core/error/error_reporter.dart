import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'failure.dart';
import '../env.dart';

part 'error_reporter.g.dart';

/// Xato kuzatuvi (Sentry) uchun yupqa qatlam: breadcrumb, foydalanuvchi konteksti, exception.
abstract class ErrorReporter {
  void breadcrumb(Failure failure);
  void setUser({String? id, String? role});
  void clearUser();
  void captureException(Object exception, {StackTrace? stackTrace});
}

/// Sentry statik API'sini testda almashtirish uchun interfeys.
abstract class SentryHubLike {
  void addBreadcrumb(Breadcrumb crumb);
  void configureScope(void Function(Scope) callback);
  void captureException(Object exception, {StackTrace? stackTrace});
}

/// Haqiqiy Sentry hub.
class DefaultSentryHub implements SentryHubLike {
  @override
  void addBreadcrumb(Breadcrumb crumb) {
    Sentry.addBreadcrumb(crumb);
  }

  @override
  void configureScope(void Function(Scope) callback) {
    Sentry.configureScope(callback);
  }

  @override
  void captureException(Object exception, {StackTrace? stackTrace}) {
    Sentry.captureException(exception, stackTrace: stackTrace);
  }
}

/// `Failure` → breadcrumb (faqat tur nomi va daraja), foydalanuvchi — faqat id va rol (telefon yo'q).
class SentryErrorReporter implements ErrorReporter {
  final SentryHubLike _hub;

  SentryErrorReporter(this._hub);

  @override
  void breadcrumb(Failure failure) {
    final level = failure.maybeWhen(
      server: () => SentryLevel.error,
      serviceUnavailable: () => SentryLevel.error,
      orElse: () => SentryLevel.warning,
    );

    // Faqat tur nomi yuboriladi — detail/fieldErrors (telefon, matn) breadcrumb'ga kirmaydi (§8.2).
    // failure turi
    final failureType = failure.map(
      network: (_) => 'NetworkFailure',
      validation: (_) => 'ValidationFailure',
      auth: (_) => 'AuthFailure',
      permission: (_) => 'PermissionFailure',
      notFound: (_) => 'NotFoundFailure',
      limit: (_) => 'LimitFailure',
      serviceUnavailable: (_) => 'ServiceUnavailableFailure',
      server: (_) => 'ServerFailure',
      unknown: (_) => 'UnknownFailure',
    );

    _hub.addBreadcrumb(
      Breadcrumb(category: 'failure', message: failureType, level: level),
    );
  }

  @override
  void setUser({String? id, String? role}) {
    _hub.configureScope((scope) {
      scope.setUser(
        SentryUser(id: id, data: role != null ? {'role': role} : null),
      );
    });
  }

  @override
  void clearUser() {
    _hub.configureScope((scope) {
      scope.setUser(null);
    });
  }

  @override
  void captureException(Object exception, {StackTrace? stackTrace}) {
    _hub.captureException(exception, stackTrace: stackTrace);
  }
}

/// Dev/test uchun — hech narsa qilmaydi.
class NoopErrorReporter implements ErrorReporter {
  @override
  void breadcrumb(Failure failure) {}

  @override
  void setUser({String? id, String? role}) {}

  @override
  void clearUser() {}

  @override
  void captureException(Object exception, {StackTrace? stackTrace}) {}
}

/// Prod + DSN bo'lsa Sentry, aks holda Noop.
@Riverpod(keepAlive: true)
ErrorReporter errorReporter(Ref ref) {
  if (Env.isProd && Env.sentryDsn.isNotEmpty) {
    return SentryErrorReporter(DefaultSentryHub());
  }
  return NoopErrorReporter();
}
