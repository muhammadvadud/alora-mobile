import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'core/env.dart';
import 'core/utils/app_logger.dart';
import 'core/error/failure.dart';
import 'app/app.dart';
import 'shared/widgets/app_snackbar.dart';
import 'core/error/failure_l10n.dart';
import 'core/error/error_reporter.dart';

Future<void> bootstrap() async {
  await Hive.initFlutter();

  FlutterError.onError = (details) {
    logger.e(
      'FlutterError',
      error: details.exception,
      stackTrace: details.stack,
    );
    if (Env.isProd && Env.sentryDsn.isNotEmpty) {
      if (details.exception is Failure) {
        final reporter = SentryErrorReporter(DefaultSentryHub());
        reporter.breadcrumb(details.exception as Failure);
        reporter.captureException(details.exception, stackTrace: details.stack);
      } else {
        Sentry.captureException(details.exception, stackTrace: details.stack);
      }
    }
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    logger.e('PlatformError', error: error, stackTrace: stack);
    if (Env.isProd && Env.sentryDsn.isNotEmpty) {
      if (error is Failure) {
        final reporter = SentryErrorReporter(DefaultSentryHub());
        reporter.breadcrumb(error);
        reporter.captureException(error, stackTrace: stack);
      } else {
        Sentry.captureException(error, stackTrace: stack);
      }
    }

    if (error is Failure) {
      final context = scaffoldMessengerKey.currentContext;
      if (context != null) {
        AppSnackbar.show(
          context,
          message: error.localizedMessage(context),
          isError: true,
        );
      }
    }

    return true;
  };

  if (Env.isProd && Env.sentryDsn.isNotEmpty) {
    await SentryFlutter.init((options) {
      options.dsn = Env.sentryDsn;
      options.tracesSampleRate = 1.0;
      options.environment = Env.env;
      options.sendDefaultPii = false;
      options.beforeSend = (SentryEvent event, Hint hint) {
        final user = event.user;
        if (user != null) {
          final data = Map<String, dynamic>.from(user.data ?? {});
          data.remove('phone');
          data.remove('email');
          data.remove('ipAddress');

          return event.copyWith(
            user: SentryUser(
              id: user.id,
              username: user.username,
              name: user.name,
              data: data.isEmpty ? null : data,
            ),
          );
        }
        return event;
      };
    });
  }
}
