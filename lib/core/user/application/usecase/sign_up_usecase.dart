import 'package:it_expert/core/utils/result.dart';

import '../../domain/user_repository_interface.dart';

class SignUpUseCase {
  final UserRepositoryInterface signUpRepository;

  SignUpUseCase(this.signUpRepository);

  Future<Result> call(String name, String lastName, String email, String password) async {
    var result = await signUpRepository.signUp(name, lastName, email, password);

    if (result.isSuccess) {
      await signUpRepository.saveUserInfoInLocalStorage(result.getOrNull());
    }
    return result;
  }
}
