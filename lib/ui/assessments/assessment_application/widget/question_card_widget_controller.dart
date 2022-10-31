import 'package:get/get.dart';

import '../../../../core/assessment/domain/dto/question_dto.dart';

class QuestionCardWidgetController extends GetxController {
  var text = "".obs;
  var imgUrl = "".obs;
  var selectedAnswerId = "".obs;
  List<AnswerDto> answers = [];

  loadNewQuestion(QuestionDto question) {
    text.value = question.text;
    answers = question.answers;
  }
}
