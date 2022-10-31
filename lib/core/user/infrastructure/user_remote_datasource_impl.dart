import 'dart:convert';

import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:it_expert/core/user/domain/dto/user_dto.dart';
import 'package:it_expert/core/utils/result.dart';

import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../application/datasource/user_remote_datasource_interface.dart';
import '../domain/dto/login_failed_dto.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSourceInterface {
  @override
  Future<Result> login(String email, String password) async {
    var response =
        await http.post(Uri.https(baseUrl, '/api/v1/users/login'), body: {
      "email": email,
      "password": password,
    });
    var json = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    switch (response.statusCode) {
      case HttpStatus.ok:
        var user = json["entity"]["user"];
        return Result.success(
          UserDto(
            userId: user["_id"],
            firstName: user["name"],
            lastName: user["lastName"],
            email: user["email"],
            companyCode: user["companyCode"],
            token: json["entity"]["token"],
          ),
        );
      case HttpStatus.unauthorized:
        return Result.failure(
          LoginFailedException(
              errorMessage: json["error"], errorCode: json["errorCode"]),
        );
      default:
        return Result.failure(LoginFailedException(
            errorMessage: json["error"], errorCode: "UNKNOWN"));
    }
  }
}
