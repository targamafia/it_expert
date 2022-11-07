import 'package:get/get.dart';
import 'package:it_expert/core/user/application/usecase/login_usecase.dart';
import 'package:it_expert/core/user/domain/dto/login_failed_dto.dart';
import 'package:it_expert/core/utils/status.dart';

import '../../../core/user/di.dart';

class LoginController extends GetxController {
  var email = "".obs;
  var password = "".obs;
  var loading = false.obs;

  var status = Status.NOT_STARTED.obs;

  var loginSuccess = false;
  var errorMessage = "";

  final LoginUseCase _loginUseCase = constructLoginUseCase();

  login() async {
    status(Status.LOADING);
    loading(true);
    loginSuccess = false;
    errorMessage = "";

    var result = await _loginUseCase.call(email.value, password.value);
    if (result.isSuccess) {
      loginSuccess = true;
      status(Status.SUCCESS);
    }

    if (result.isFailure && result.exceptionOrNull() is LoginFailedException) {
      errorMessage =
          (result.exceptionOrNull() as LoginFailedException).errorMessage;
      status(Status.ERROR);
    }

    loading(false);
  }
}
