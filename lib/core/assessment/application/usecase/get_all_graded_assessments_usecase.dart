import 'package:it_expert/core/assessment/domain/assessment_repository_interface.dart';
import 'package:it_expert/core/user/application/usecase/get_user_info_local_usecase.dart';
import 'package:it_expert/core/user/domain/dto/user_dto.dart';
import 'package:it_expert/core/utils/result.dart';

class GetAllGradedAssessmentsUseCase {
  final AssessmentRepositoryInterface assessmentRepositoryInterface;
  final GetUserInfoLocalUseCase getUserInfoLocalUseCase;
  GetAllGradedAssessmentsUseCase(
      this.assessmentRepositoryInterface, this.getUserInfoLocalUseCase);
  Future<Result> call() async {
    print("Get all graded assessments usecase");
    var userInfoResult = await getUserInfoLocalUseCase.call();

    if (userInfoResult.isFailure) {
      return Result.failure(LocalUserInfoNotFoundException());
    }

    var user = (userInfoResult.getOrNull() as UserDto);

    if (user.userId == null || user.userId!.isEmpty) {
      return Result.failure(UserIdIsNullOrEmptyException());
    }
    return assessmentRepositoryInterface.getAllGradedAssessments(user.userId!);
  }
}

class LocalUserInfoNotFoundException implements Exception {}

class UserIdIsNullOrEmptyException implements Exception {}
