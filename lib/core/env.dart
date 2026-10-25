class Env {
  static const String _rawApiBaseUrl = String.fromEnvironment('API_BASE_URL');

  /// `https://<host>/api/v1/` — doim `/` bilan tugaydi: `ApiPaths` yo'llari
  /// boshida `/` siz (§8.1), Dio `baseUrl + path` ni shunchaki ulaydi.
  static final String apiBaseUrl = _rawApiBaseUrl.isEmpty || _rawApiBaseUrl.endsWith('/')
      ? _rawApiBaseUrl
      : '$_rawApiBaseUrl/';
  static const String wsBaseUrl = String.fromEnvironment('WS_BASE_URL');
  static const String sentryDsn = String.fromEnvironment('SENTRY_DSN');
  static const String env = String.fromEnvironment('ENV', defaultValue: 'dev');

  /// Ilova versiyasi va build raqami — build vaqtida `--dart-define` orqali
  /// (`pubspec.yaml` `version` dan skript/CI oladi; §17 da package_info yo'q).
  static const String appVersion = String.fromEnvironment('APP_VERSION', defaultValue: '0.0.0');
  static const String buildNumber = String.fromEnvironment('BUILD_NUMBER', defaultValue: '0');

  /// LAN testlarda (masalan `lan.json`) `ENV` "dev" bo'lsa ham, PII logcat'ga tushmasligi
  /// uchun batafsil loglarni chiqarish alohida bayroq orqali boshqariladi.
  /// Agar `VERBOSE_LOGS` true bo'lsa, dio loglari va app_logger debug darajasida ishlaydi.
  static const bool verboseLogs = bool.fromEnvironment('VERBOSE_LOGS');

  /// `const` — `if (Env.isDev)` shartlari kompilyatsiyada yo'qoladi, dev kod
  /// (komponent galereyasi, so'rov logi) prod binary'ga kirmaydi.
  static const bool isProd = env == 'prod';
  static const bool isDev = env == 'dev';
}
