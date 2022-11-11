import 'package:get/get.dart';
import 'package:it_expert/core/user/application/datasource/user_local_datasource_interface.dart';
import 'package:it_expert/core/user/domain/dto/user_dto.dart';
import 'package:it_expert/core/utils/result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalDataSourceImpl implements UserLocalDataSourceInterface {
  @override
  Future<Result> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    return Result.success(
      UserDto(
        userId: prefs.getString('userInfo.userId'),
        firstName: prefs.getString('userInfo.firstName'),
        lastName: prefs.getString('userInfo.lastName'),
        email: prefs.getString('userInfo.email'),
        companyCode: prefs.getString('userInfo.companyCode'),
        token: prefs.getString('userInfo.token'),
      ),
    );
  }

  @override
  Future<Result> saveUserInfo(UserDto userDto) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userInfo.userId', userDto.userId ?? "");
    await prefs.setString('userInfo.firstName', userDto.firstName ?? "");
    await prefs.setString('userInfo.lastName', userDto.lastName ?? "");
    await prefs.setString('userInfo.email', userDto.email ?? "");
    await prefs.setString('userInfo.companyCode', userDto.companyCode ?? "");
    await prefs.setString('userInfo.token', userDto.token ?? "");
    return Result.success(true);
  }

  Future<Result> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userInfo.userId', "");
    await prefs.setString('userInfo.firstName', "");
    await prefs.setString('userInfo.lastName', "");
    await prefs.setString('userInfo.email', "");
    await prefs.setString('userInfo.companyCode', "");
    await prefs.setString('userInfo.token', "");
    return Result.success(true);
  }
}
