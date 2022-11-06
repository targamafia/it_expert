import 'package:get/get.dart';
import 'package:it_expert/core/user/application/usecase/sign_up_usecase.dart';
import 'package:it_expert/core/user/domain/dto/sign_up_failed_dto.dart';

import '../../../core/user/di.dart';

class SignUpController extends GetxController {
  var name = "".obs;
  var lastName = "".obs;
  var email = "".obs;
  var password = "".obs;
  var confirmedPassword = "".obs;

  var loading = false.obs;
  var signUpSuccess = false;
  var errorMessage = "";

  final SignUpUseCase _signUpUseCase = constructSignUpUseCase();

  signUp() async {
    loading(true);
    signUpSuccess = false;
    errorMessage = "";

    var result = await _signUpUseCase.call(name.value, lastName.value, email.value, password.value);
    if (result.isSuccess) {
      signUpSuccess = true;
    }

    if (result.isFailure && result.exceptionOrNull() is SignUpFailedException) {
      errorMessage =
          (result.exceptionOrNull() as SignUpFailedException).errorMessage;
    }

    loading(false);
  }
}