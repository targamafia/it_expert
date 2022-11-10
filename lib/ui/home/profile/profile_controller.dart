import 'package:get/get.dart';
import 'package:it_expert/core/user/application/usecase/fetch_user_stats_usecase.dart';
import 'package:it_expert/core/user/application/usecase/get_user_info_local_usecase.dart';
import 'package:it_expert/core/user/application/usecase/logout_usecase.dart';
import 'package:it_expert/core/user/di.dart';


class ProfilePageController extends GetxController {
  LogOutUseCase logOutUseCase = constructLogOutUseCase();
  FetchUserStatsUsecase userStatsUsecase = constructUserStatsUseCase();
  GetUserInfoLocalUseCase userInfoLocalUseCase = constructGetUserInfoLocalUseCase();

  String name = "";
  String lastName = "";
  String takenAssessments = "";
  String premiumAssessments = "";
  var errorMessage = "".obs;

  fetchUserData() async {
    var resultInfo = await userInfoLocalUseCase.call();
    var id = "";
    if (resultInfo.isSuccess){
      var data = resultInfo.getOrNull();
      name = data.firstName;
      lastName = data.lastName;
      id = data.userId;
    } else {
      var error = resultInfo.exceptionOrNull() as Exception;
      return error.toString();
    }

    var resultStats = await userStatsUsecase.call(id);
    if (resultStats.isSuccess){
      takenAssessments = resultStats.getOrNull().takenAssessments.toString();
      premiumAssessments = resultStats.getOrNull().premiumAssessments.toString();
    } else{
      var error = resultStats.exceptionOrNull() as Exception;
      return error.toString();
    }
  }

  getUserName() {
    return name + " " + lastName;
  }

  logOut() async {
    var result = await logOutUseCase.call();
    if (result.isSuccess) {
      return result.isSuccess;
    } else {
      var error = result.exceptionOrNull() as Exception;
      return error.toString();
    }
  }

}