import 'package:get/get.dart';
import 'package:it_expert/core/user/application/usecase/get_profile_data_usecase.dart';
import 'package:it_expert/core/user/di.dart';


class UserFailedExamsController extends GetxController {
  GetProfileDataUseCase getProfileDataUseCase = constructProfileDataUseCase();

  String name = "";
  String lastName = "";
  var errorMessage = "".obs;

  loadProfileData() async {
    var result  = await getProfileDataUseCase.call();
    if (result.isSuccess){
      name = result.getOrNull().firstName.toString();
      lastName = result.getOrNull().lastName.toString();
    } else{
      var error = result.exceptionOrNull() as Exception;
      errorMessage(error.toString());
    }
  }
}