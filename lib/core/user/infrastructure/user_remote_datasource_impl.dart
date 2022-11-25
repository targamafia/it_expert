import 'dart:convert';

import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:it_expert/core/user/domain/dto/Exceptions/no_stats_exceptions.dart';
import 'package:it_expert/core/user/domain/dto/sign_up_failed_dto.dart';
import 'package:it_expert/core/user/domain/dto/user_dto.dart';
import 'package:it_expert/core/user/domain/dto/user_stats_dto.dart';
import 'package:it_expert/core/utils/result.dart';

import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../application/datasource/user_remote_datasource_interface.dart';
import '../domain/dto/login_failed_dto.dart';
import '../../api/api.dart';

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

  @override
  Future<Result> signUp(
      String name, String lastName, String email, String password) async {
    var response =
        await http.post(Uri.https(baseUrl, '/api/v1/users/signUp'), body: {
      "name": name,
      "lastName": lastName,
      "email": email,
      "password": password,
      "companyCode": "MRP"
    });
    var json = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    switch (response.statusCode) {
      case HttpStatus.created:
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
          SignUpFailedException(
              errorMessage: json["error"], errorCode: json["errorCode"]),
        );
      default:
        return Result.failure(SignUpFailedException(
            errorMessage: json["error"], errorCode: "UNKNOWN"));
    }
  }

  @override
  Future<Result> fetchUserStats(String id) async {
    var response = await API.get("/users/me/stats");
    var json = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    switch (response.statusCode) {
      case HttpStatus.ok:
        var a = json["entity"];
        return Result.success(UserStatsDto(
            premiumAssessments: a["premiumAssessments"] ?? 0,
            takenAssessments: a["takenAssessments"] ?? 0));
    }
    return Result.failure(
        NoStatsException("Error al obtener las estadísticas de usuario"));
  }

  @override
  Future<Result> requestRecoveryPin(String email) async{
    var response =
        await http.post(Uri.https(baseUrl, '/api/v1/users/password-recovery-pin'), body: {
      "email": email,
    });
    var json = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    switch (response.statusCode) {
      case HttpStatus.ok:
        return Result.success({});

      case HttpStatus.unauthorized:
        return Result.failure(
          SignUpFailedException(
              errorMessage: json["error"], errorCode: json["errorCode"]),
        );
      default:
        return Result.failure(SignUpFailedException(
            errorMessage: json["error"], errorCode: "UNKNOWN"));
    }
  }

  @override
  Future<Result> changePassword(String email, String pin, String newPassword) async {
    var response =
        await http.post(Uri.https(baseUrl, '/api/v1/users/reset-password'), body: {
          "email": email,
          "passwordPin": pin,
          "password": newPassword
    });
    var json = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    switch (response.statusCode) {
      case HttpStatus.ok:
        return Result.success({});
      case HttpStatus.unauthorized:
        return Result.failure(
          SignUpFailedException(
              errorMessage: json["error"], errorCode: json["errorCode"]),
        );
      default:
        return Result.failure(SignUpFailedException(
            errorMessage: json["error"], errorCode: "UNKNOWN"));
    }
  }
}
