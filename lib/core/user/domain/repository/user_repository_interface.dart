import 'package:it_expert/core/user/domain/dto/login_dto.dart';

import '../../../utils/result.dart';

class UserRepositoryInterface {
  Future<Result> login(String email, String password) {
    throw UnimplementedError();
  }
}
