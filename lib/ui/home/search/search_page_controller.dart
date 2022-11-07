import 'package:get/get.dart';
import 'package:it_expert/core/assessment/application/usecase/get_all_assessments_usecase.dart';
import 'package:it_expert/core/assessment/domain/dto/assessment_dto.dart';

import '../../../core/assessment/di.dart';
import '../../../core/utils/status.dart';

class SearchPageController extends GetxController {
  var filtered = "".obs;
  final GetAllAssessmentsUseCase _fetchAllAssessments =
      constructGetAllAssessmentsUseCase();
  var status = Status.NOT_STARTED.obs;
  var _assessments = <AssessmentDto>[];
  var filteredAssessments = <AssessmentDto>[].obs;

  void filter() {
    filteredAssessments(_assessments
        .where((element) =>
            element.title.toLowerCase().contains(filtered.toLowerCase()))
        .toList());
  }

  void fetchAssessments() async {
    status(Status.LOADING);
    var result = await _fetchAllAssessments.call();
    if (result.isSuccess) {
      _assessments = result.getOrNull();
      filteredAssessments = RxList.from(_assessments);
      status(Status.SUCCESS);
    } else {
      status(Status.ERROR);
    }
  }
}
