import 'package:it_expert/core/assessment/domain/assessment_repository_interface.dart';
import 'package:it_expert/core/utils/result.dart';

import 'assessment_remote_datasource_interface.dart';

class AssessmentRepositoryImpl implements AssessmentRepositoryInterface {
  final AssessmentRemoteDataSourceInterface assessmentRemoteDataSourceInterface;

  AssessmentRepositoryImpl(this.assessmentRemoteDataSourceInterface);

  @override
  Future<Result> getFeaturedAssessments() async {
    return assessmentRemoteDataSourceInterface.fetchFeaturedAssessments();
  }

  @override
  Future<Result> getAssessment(String id) async {
    return assessmentRemoteDataSourceInterface.fetchAssessment(id);
  }

  @override
  Future<Result> gradeAssessment(
      Map<String, String> questionsAnswer, String assessmentId) async {
    var response = await assessmentRemoteDataSourceInterface.gradeAssessment(
        questionsAnswer, assessmentId);
    print(response.getOrNull().toString());
    return response;
  }

  @override
  Future<Result> getAssessmentGrade(String assessmentId) async {
    return assessmentRemoteDataSourceInterface
        .fetchAssessmentGrade(assessmentId);
  }

  @override
  Future<Result> getAllAssessments() async {
    return assessmentRemoteDataSourceInterface.fetchAllAssessments();
  }

  @override
  Future<Result> getAllGradedAssessments(String userId) {
    return assessmentRemoteDataSourceInterface
        .fetchAllGradedAssessments(userId);
  }

  @override
  Future<Result> getUserPremiumAssessments(String userId) {
    return assessmentRemoteDataSourceInterface
        .fetchUserPremiumAssessments(userId);
  }

  Future<Result> getBestAssessments() {
    return assessmentRemoteDataSourceInterface.fetchBestAssessments();
  }

  @override
  Future<Result> getAssessmentAttempts(String assessmentId) {
    return assessmentRemoteDataSourceInterface
        .fetchAssessmentAttemps(assessmentId);
  }

  @override
  Future<Result> getIsAvailableInfo(String assessmentId) {
    return assessmentRemoteDataSourceInterface.isAvailable(assessmentId);
  }

  @override
  Future<Result> getAssessmentGradeWithAnswersByGradeId(String gradeId) {
    return assessmentRemoteDataSourceInterface
        .fetchAssessmentGradeWithAnswersByGradeId(gradeId);
  }
}
