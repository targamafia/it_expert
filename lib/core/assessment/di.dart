import 'package:it_expert/core/assessment/application/assessment_repository_impl.dart';
import 'package:it_expert/core/assessment/application/usecase/get_all_assessments_usecase.dart';
import 'package:it_expert/core/assessment/application/usecase/get_assessment_questions_usecase.dart';
import 'package:it_expert/core/assessment/application/usecase/get_best_assessments_usecase.dart';
import 'package:it_expert/core/assessment/application/usecase/get_user_premium_assessments_usecase.dart';
import 'package:it_expert/core/assessment/infraestructure/assessment_remote_datasource_impl.dart';
import 'package:it_expert/core/user/di.dart';

import 'application/usecase/get_all_graded_assessments_usecase.dart';
import 'application/usecase/get_assessment_attempts_usecase.dart';
import 'application/usecase/get_assessment_grade_usecase.dart';
import 'application/usecase/get_assessment_grade_with_answers_by_grade_id.dart';
import 'application/usecase/get_assessment_is_available_info_usecase.dart';
import 'application/usecase/get_assessment_usecase.dart';
import 'application/usecase/get_featured_assessment_usecase.dart';
import 'application/usecase/grade_assessment_usecase.dart';

GetFeaturedAssessmentsUseCase constructGetFeaturedAssessmentsUseCase() {
  return GetFeaturedAssessmentsUseCase(
      AssessmentRepositoryImpl(AssessmentRemoteDataSourceImpl()));
}

GetAssessmentQuestionsUseCase constructGetAssessmentQuestionUseCase() {
  return GetAssessmentQuestionsUseCase(
      AssessmentRepositoryImpl(AssessmentRemoteDataSourceImpl()));
}

GradeAssessmentUseCase constructGradeAssessmentUseCase() {
  return GradeAssessmentUseCase(
      AssessmentRepositoryImpl(AssessmentRemoteDataSourceImpl()));
}

GetAssessmentGradeUseCase constructGetAssessmentGradeUseCase() {
  return GetAssessmentGradeUseCase(
      AssessmentRepositoryImpl(AssessmentRemoteDataSourceImpl()));
}

GetAllAssessmentsUseCase constructGetAllAssessmentsUseCase() {
  return GetAllAssessmentsUseCase(
      AssessmentRepositoryImpl(AssessmentRemoteDataSourceImpl()));
}

GetAllGradedAssessmentsUseCase constructGetAllGradedAssessmentsUseCase() {
  return GetAllGradedAssessmentsUseCase(
      AssessmentRepositoryImpl(AssessmentRemoteDataSourceImpl()),
      constructGetUserInfoLocalUseCase());
}

PremiumAssessmentsUseCase constructPremiumAssessmentUseCase() {
  return PremiumAssessmentsUseCase(
      AssessmentRepositoryImpl(AssessmentRemoteDataSourceImpl()));
}

GetBestAssessmentsUseCase constructGetBestAssessmentsUseCase() {
  return GetBestAssessmentsUseCase(
      AssessmentRepositoryImpl(AssessmentRemoteDataSourceImpl()));
}

GetAssessmentAttemptsUsecase constructGetAssessmentAttemptsUsecase() {
  return GetAssessmentAttemptsUsecase(
      AssessmentRepositoryImpl(AssessmentRemoteDataSourceImpl()));
}

GetAssessmentUseCase constructGetAssessmentUseCase() {
  return GetAssessmentUseCase();
}

GetAssessmentAvailableInfoUseCase constructGetAssessmentAvailableInfoUseCase() {
  return GetAssessmentAvailableInfoUseCase(
      AssessmentRepositoryImpl(AssessmentRemoteDataSourceImpl()));
}

GetAssessmentGradeWithAnswersByGradeId
    constructGetAssessmentGradeWithAnswersByGradeId() {
  return GetAssessmentGradeWithAnswersByGradeId(
      AssessmentRepositoryImpl(AssessmentRemoteDataSourceImpl()));
}
