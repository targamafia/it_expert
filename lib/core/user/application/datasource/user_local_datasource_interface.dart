import 'package:it_expert/core/user/domain/dto/user_dto.dart';
import 'package:it_expert/core/utils/result.dart';

class UserLocalDataSourceInterface {
  Future<Result> saveUserInfo(UserDto userDto) async {
    throw UnimplementedError();
  }

  Future<Result> getUserInfo() async {
    throw UnimplementedError();
  }

  Future<Result> logout() async {
    throw UnimplementedError();
  }
}
