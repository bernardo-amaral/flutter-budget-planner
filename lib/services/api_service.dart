class ApiService {
  static const String _baseUrl = "http://192.168.15.13:9000";

  static Uri endpoint(String path) {
    return Uri.parse("$_baseUrl$path");
  }
}
