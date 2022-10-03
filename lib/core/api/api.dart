import 'package:http/http.dart' as http;

import '../constants.dart';

class TokenSingleton {
  static final TokenSingleton _singleton = TokenSingleton._internal();

  Future<String> get() async {
    return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MzJlM2EzNWM5Y2Q0OGYyMDg1MzVlMDciLCJuYW1lIjoiVGVzdCIsImNvbXBhbnlDb2RlIjoiTVJQIiwiZXhwIjoxNjY1ODcyMTA2Ljg3NywiaWF0IjoxNjY0NTc2MTA2fQ.UNPIuJs0bFpC7l0h6dhp0Q_o-UiZ3QRKewCh6rY63JM";
  }

  factory TokenSingleton() {
    return _singleton;
  }

  TokenSingleton._internal();
}

class API {
  static Future<http.Response> post(String path, {Object? body}) async {
    var token = await TokenSingleton().get();
    return http.post(Uri.https(baseUrl, path),
        headers: {'Authorization': "Bearer $token"}, body: body);
  }

  static Future<http.Response> get(String path) async {
    assert(path.startsWith("/"));
    var token = await TokenSingleton().get();
    var response = await http.get(Uri.https(baseUrl, '/api/v1$path'),
        headers: {'Authorization': "Bearer $token"});
    return response;
  }
}
