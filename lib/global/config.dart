class GlobalConfig {
  // static const String baseUrl = 'http://172.27.154.73:8974';
  static const String baseUrl = 'http://127.0.0.1:8974';
  // static const String? proxy = '127.0.0.1:8080';
  static const String? proxy = null;
  static const bool isDebug = true;
  static const bool isMock = false;
  static const Duration connectTimeout = Duration(seconds: 3);
  static const Duration receiveTimeout = Duration(seconds: 3);
  static const Duration sendTimeout = Duration(seconds: 3);
}
