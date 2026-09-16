class Env {
  static const String apiBaseUrl = String.fromEnvironment('API_BASE_URL');
  static const String wsBaseUrl = String.fromEnvironment('WS_BASE_URL');
  static const String sentryDsn = String.fromEnvironment('SENTRY_DSN');
  static const String env = String.fromEnvironment('ENV', defaultValue: 'dev');

  static bool get isProd => env == 'prod';
  static bool get isDev => env == 'dev';
}
