import 'package:get/get.dart';
import 'package:it_expert/core/user/application/usecase/login_usecase.dart';
import 'package:it_expert/core/user/domain/dto/login_failed_dto.dart';

import '../../../core/user/dependency_injection/dependency_injection.dart';

class LoginController extends GetxController {
  var email = "".obs;
  var password = "".obs;
  var loading = false.obs;

  var loginSuccess = false;
  var errorMessage = "";

  final LoginUseCase _loginUseCase = constructLoginUseCase();

  login() async {
    loading(true);
    loginSuccess = false;
    errorMessage = "";

    var result = await _loginUseCase.call(email.value, password.value);
    if (result.isSuccess) {
      loginSuccess = true;
    }

    if (result.isFailure && result.exceptionOrNull() is LoginFailedException) {
      errorMessage =
          (result.exceptionOrNull() as LoginFailedException).errorMessage;
    }

    loading(false);
  }
}
