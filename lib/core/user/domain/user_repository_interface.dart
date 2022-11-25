import 'package:it_expert/core/user/domain/dto/user_dto.dart';

import '../../utils/result.dart';

class UserRepositoryInterface {
  Future<Result> login(String email, String password) async {
    throw UnimplementedError();
  }

  Future<Result> signUp(
      String name, String lastName, String email, String password) async {
    throw UnimplementedError();
  }

  Future<Result> saveUserInfoInLocalStorage(UserDto userDto) async {
    throw UnimplementedError();
  }

  Future<Result> getUserInfoInLocalStorage() async {
    throw UnimplementedError();
  }

  Future<Result> getUserInfo() async{
    throw UnimplementedError();
  }

  Future<Result> logout() async{
    throw UnimplementedError();
  }

  Future<Result> fetchUserStats(String id) async{
    throw UnimplementedError();
  }
}
