import 'package:get/get.dart';
import 'package:it_expert/core/assessment/domain/dto/assessment_dto.dart';
import 'package:it_expert/core/assessment/domain/dto/post_grade_assessment_dto.dart';
import 'package:it_expert/core/assessment/domain/dto/question_dto.dart';

import '../../../core/assessment/di.dart';
import '../../../core/utils/status.dart';
import 'dart:developer' as developer;

class AssessmentApplicationController extends GetxController {
  final _getAssessmentUseCase = constructGetAssessmentUseCase();
  final _gradeAssessmentUseCase = constructGradeAssessmentUseCase();
  var questions = [];
  var totalQuestions = 0.obs;
  String errorMessage = "";
  var status = Status.NOT_STARTED.obs;
  Rx<QuestionDto> currentQuestion = QuestionDto("", "", []).obs;
  var questionIndex = 0.obs;
  var selectedAnswerId = "".obs;
  Map<String, String> questionsAnswer = {};
  var assessmentId = "";

  void fetchQuestions(String assessmentId) async {
    this.assessmentId = assessmentId;
    status(Status.LOADING);
    var result = await _getAssessmentUseCase.call(assessmentId);
    if (result.isSuccess) {
      questions = (result.getOrNull() as AssessmentDto).questions;
      currentQuestion(questions[questionIndex.value]);
      totalQuestions(questions.length);
      status(Status.SUCCESS);
    } else if (result.isFailure) {
      errorMessage = result.exceptionOrNull().toString();
      print(errorMessage);
      status(Status.ERROR);
    }
  }

  Future<double> gradeAssessment() async {
    questionsAnswer[currentQuestion.value.id] = selectedAnswerId.value;
    var result =
        await _gradeAssessmentUseCase.call(questionsAnswer, assessmentId);
    if (result.isSuccess) {
      return (result.getOrNull() as PostGradeAssessmentDto).grade;
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
