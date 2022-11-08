import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:it_expert/core/user/application/usecase/get_profile_data_usecase.dart';
import 'package:it_expert/core/user/application/usecase/logout_usecase.dart';
import 'package:it_expert/core/user/di.dart';


class ProfilePageController extends GetxController {
  GetProfileDataUseCase getProfileDataUseCase = constructProfileDataUseCase();
  LogOutUseCase logOutUseCase = constructLogOutUseCase();

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

  getUserName() {
    return name + " " + lastName;
  }

  logOut() async {
    var result  = await logOutUseCase.call();
    if (result.isSuccess){
      return result.isSuccess;
    } else{
      var error = result.exceptionOrNull() as Exception;
      return error.toString();
    }

  }

}