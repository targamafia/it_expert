import 'package:it_expert/core/utils/result.dart';

import '../../domain/repository/user_repository_interface.dart';

class LoginUseCase {
  final UserRepositoryInterface loginRepository;

  LoginUseCase(this.loginRepository);

  Future<Result> call(String email, String password) {
    return loginRepository.login(email, password);
  }
}
