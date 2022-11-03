import '../../utils/result.dart';

class AssessmentRepositoryInterface {
  Future<Result> getFeaturedAssessments() async {
    throw UnimplementedError();
  }
 Future<Result> getAllAssessments() async {
    throw UnimplementedError();
  }

  Future<Result> getAssessment(String id) async {
    throw UnimplementedError();
  }

  Future<Result> gradeAssessment(
      Map<String, String> questionsAnswer, String assessmentId) {
    throw UnimplementedError();
  }

  Future<Result> getAssessmentGrade(String assessmentId) {
    throw UnimplementedError();
  }
}
