import 'dart:developer';

import 'package:get/get.dart';
import 'package:it_expert/core/assessment/application/usecase/get_all_assessments_usecase.dart';
import 'package:it_expert/core/assessment/application/usecase/get_all_graded_assessments_usecase.dart';
import 'package:it_expert/core/assessment/application/usecase/get_assessment_usecase.dart';
import 'package:it_expert/core/assessment/application/usecase/get_user_premium_assessments_usecase.dart';
import 'package:it_expert/core/assessment/di.dart';
import 'package:it_expert/core/assessment/domain/dto/assessment_dto.dart';
import 'package:it_expert/core/assessment/domain/dto/graded_assessment_dto.dart';
import 'package:it_expert/core/assessment/domain/dto/premium_assessment_dto.dart';
import 'package:it_expert/core/user/application/usecase/get_user_info_local_usecase.dart';
import 'package:it_expert/core/user/di.dart';
import 'package:it_expert/core/utils/status.dart';

class UserPremiumAssessmentsController extends GetxController {
  final PremiumAssessmentsUseCase _getPremiumAssessmentsUseCase =
      constructPremiumAssessmentUseCase();
  final GetUserInfoLocalUseCase userInfoLocalUseCase =
      constructGetUserInfoLocalUseCase();
  final GetAssessmentUseCase _getAssessmentUseCase = constructGetAssessmentUseCase();

  var status = Status.NOT_STARTED.obs;
  List<AssessmentDto> assessments = [];

  void fetchHistory() async {
    var resultInfo = await userInfoLocalUseCase.call();
    var id = "";
    if (resultInfo.isSuccess) {
      var data = resultInfo.getOrNull();
      id = data.userId;
    }

    status(Status.LOADING);
    var result = await _getPremiumAssessmentsUseCase.call(id);
    if (result.isSuccess) {
      assessments = result.getOrNull() as List<AssessmentDto>;
      print(assessments);
      if (assessments.isNotEmpty) {
        status(Status.SUCCESS);
      } else {
        status(Status.NOT_AVAILABLE);
      }
    }
  }
  void fetchAssessment() async {
    var result = await _getAssessmentUseCase.call(":stringId");
    if (result.isSuccess) {
      result.getOrNull() as AssessmentDto;
    }
  }
}
