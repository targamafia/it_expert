import 'package:get/get.dart';
import 'package:it_expert/core/assessment/domain/dto/assessment_dto.dart';
import 'package:it_expert/core/assessment/domain/dto/question_dto.dart';
import '../../../core/assessment/di.dart';
import '../../../core/assessment/domain/dto/grade_assessment_response_dto.dart';
import '../../../core/utils/status.dart';

class AssessmentApplicationController extends GetxController {
  final _getAssessmentUseCase = constructGetAssessmentQuestionUseCase();
  final _gradeAssessmentUseCase = constructGradeAssessmentUseCase();
  var questions = [];
  var totalQuestions = 0.obs;
  String errorMessage = "";
  var status = Status.NOT_STARTED.obs;
  Rx<QuestionDto> currentQuestion =
      QuestionDto(id: "id", text: "text", answers: [], imageUrl: "").obs;
  var questionIndex = 0.obs;
  var selectedAnswerId = "".obs;
  Map<String, String> questionsAnswer = {};
  var assessmentId = "";
  late AssessmentDto assessmentDto;

  void fetchQuestions(String assessmentId) async {
    this.assessmentId = assessmentId;
    print(this.assessmentId);
    status(Status.LOADING);
    var result = await _getAssessmentUseCase.call(assessmentId);
    if (result.isSuccess) {
      assessmentDto = result.getOrNull() as AssessmentDto;
      questions = (result.getOrNull() as AssessmentDto).questions;
      currentQuestion(questions[questionIndex.value]);
      totalQuestions(questions.length);
      status(Status.SUCCESS);
    } else if (result.isFailure) {
      errorMessage = result.exceptionOrNull().toString();
      status(Status.ERROR);
    }
  }

  Future<double> gradeAssessment() async {
    questionsAnswer[currentQuestion.value.id] = selectedAnswerId.value;
    var result =
        await _gradeAssessmentUseCase.call(questionsAnswer, assessmentId);
    if (result.isSuccess) {
      return (result.getOrNull() as GradeAssessmentResponseDto).grade;
    }
    return 0.0;
  }

  void nextQuestion() {
    questionsAnswer[currentQuestion.value.id] = selectedAnswerId.value;

    questionIndex(questionIndex.value + 1);
    currentQuestion(questions[questionIndex.value]);
    selectedAnswerId("");
  }
}
