import 'package:get/get.dart';
import 'package:it_expert/core/user/application/usecase/change_password_usecase.dart';
import 'package:it_expert/core/user/di.dart';

class ResetFormController extends GetxController {
  var password = "".obs;
  var password2 = "".obs;
  var pin = "".obs;
  var isSuccess = false;
  var errorMessage = "".obs;

  final ChangePasswordUseCase _requestRecoveryPinUseCase = constructChangePasswordUseCase();

  changePassword(String email) async {
    if (password.value == password2.value){
      var result = await _requestRecoveryPinUseCase.call(email, pin.value, password.value);
      print(pin.value);
      print(result.exceptionOrNull());
      if (result.isSuccess){
        isSuccess = true;
        return result;
      } else{
        var error = result.exceptionOrNull() as Exception;
        print(error.toString());
        return errorMessage(error.toString());
      }
    } else{
      return errorMessage("Las contraseñas no coinciden");
    }
  }

}