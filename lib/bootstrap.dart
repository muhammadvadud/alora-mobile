import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'core/env.dart';
import 'core/utils/app_logger.dart';

Future<void> bootstrap() async {
  await Hive.initFlutter();

  FlutterError.onError = (details) {
    logger.e(
      'FlutterError',
      error: details.exception,
      stackTrace: details.stack,
    );
    if (Env.isProd && Env.sentryDsn.isNotEmpty) {
      Sentry.captureException(details.exception, stackTrace: details.stack);
    }
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    logger.e('PlatformError', error: error, stackTrace: stack);
    if (Env.isProd && Env.sentryDsn.isNotEmpty) {
      Sentry.captureException(error, stackTrace: stack);
    }
    return true;
  };

  if (Env.isProd && Env.sentryDsn.isNotEmpty) {
    await SentryFlutter.init((options) {
      options.dsn = Env.sentryDsn;
      options.tracesSampleRate = 1.0;
      options.environment = Env.env;
    });
  }
}
