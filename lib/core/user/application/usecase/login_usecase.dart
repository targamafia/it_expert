import 'package:it_expert/core/utils/result.dart';

import '../../domain/user_repository_interface.dart';

class LoginUseCase {
  final UserRepositoryInterface loginRepository;

  LoginUseCase(this.loginRepository);

  Future<Result> call(String email, String password) async {
    var result = await loginRepository.login(email, password);

    if (result.isSuccess) {
      print(result.getOrNull());
      await loginRepository.saveUserInfoInLocalStorage(result.getOrNull());
    }
    return result;
  }
}
