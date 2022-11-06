import 'package:http/http.dart' as http;
import 'package:it_expert/core/constants.dart';
import 'package:it_expert/core/user/application/usecase/get_auth_token_local_usecase.dart';

import '../user/di.dart';

class TokenSingleton {
  static final TokenSingleton _singleton = TokenSingleton._internal();
  final GetAuthTokenLocalUseCase _getAuthTokenFromLocalStorage =
      constructGetAuthTokenLocalUseCase();
  String _token = "";

  Future<String> get() async {
    if (_token.isEmpty) {
      var futureToken = await _getAuthTokenFromLocalStorage.call();
      if (futureToken.getOrNull() != null) {
        _token += futureToken.getOrNull();
      } else {
        _token = '';
      }
    }
    return _token;
  }

  factory TokenSingleton() {
    return _singleton;
  }

  TokenSingleton._internal();
}

class API {
  static Future<http.Response> post(String path, {Object? body}) async {
    assert(path.startsWith("/"));
    var token = await TokenSingleton().get();
    var response = await http.post(Uri.https(baseUrl, '/api/v1$path'),
        headers: {
          'Authorization': "Bearer $token",
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);
    return response;
  }

  static Future<http.Response> get(String path) async {
    assert(path.startsWith("/"));
    var token = await TokenSingleton().get();
    var response = await http.get(Uri.https(baseUrl, '/api/v1$path'), headers: {
      'Authorization': "Bearer $token",
    });
    return response;
  }
}
