import 'package:get/get.dart';
import 'package:it_expert/core/user/application/usecase/request_recovery_pin_usecase.dart';
import 'package:it_expert/core/user/di.dart';

class InstructionsController extends GetxController {
  var email = "".obs;
  var sentEmailSucess = false;
  var errorMessage = "".obs;

  final RequestRecoveryPinUseCase _requestRecoveryPinUseCase = constructRequestRecoveryPin();

  requestPin() async {
      var result = await _requestRecoveryPinUseCase.call(email.value);

      if (result.isSuccess){
        sentEmailSucess = true;
        return result;
      } else{
        var error = result.exceptionOrNull() as Exception;
        errorMessage(error.toString());
      }
  }

  getEmail() async {
    return email;
  }
}