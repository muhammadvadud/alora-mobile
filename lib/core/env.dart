class Env {
  static const String apiBaseUrl = String.fromEnvironment('API_BASE_URL');
  static const String wsBaseUrl = String.fromEnvironment('WS_BASE_URL');
  static const String sentryDsn = String.fromEnvironment('SENTRY_DSN');
  static const String env = String.fromEnvironment('ENV', defaultValue: 'dev');

  /// Ilova versiyasi va build raqami — build vaqtida `--dart-define` orqali
  /// (`pubspec.yaml` `version` dan skript/CI oladi; §17 da package_info yo'q).
  static const String appVersion = String.fromEnvironment(
    'APP_VERSION',
    defaultValue: '0.0.0',
  );
  static const String buildNumber = String.fromEnvironment(
    'BUILD_NUMBER',
    defaultValue: '0',
  );

  static bool get isProd => env == 'prod';
  static bool get isDev => env == 'dev';
}
