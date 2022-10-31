import 'package:it_expert/core/user/domain/dto/user_dto.dart';

import '../../utils/result.dart';

class UserRepositoryInterface {
  Future<Result> login(String email, String password) async {
    throw UnimplementedError();
  }

  Future<Result> saveUserInfoInLocalStorage(UserDto userDto) async {
    throw UnimplementedError();
  }
}
