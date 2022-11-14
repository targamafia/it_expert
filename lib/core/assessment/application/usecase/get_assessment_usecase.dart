import 'package:it_expert/core/assessment/domain/dto/assessment_dto.dart';

import '../../../utils/result.dart';

class GetAssessmentUseCase {

  Future<Result> call(String id) {
    return Future.delayed(
         const Duration(milliseconds: 500),
        () => Result.success(AssessmentDto(
            id: "id",
            title: "title",
            description: "description",
            thumbnailUrl: "thumbnailUrl",
            isPrivate: false,
            isPremium: false,
            categories: [],
            rating: 5.0,
            questions: [])));
  }
}
