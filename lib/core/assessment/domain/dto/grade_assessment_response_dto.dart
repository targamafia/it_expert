import 'grade_assessment_question_response.dart';

class GradeAssessmentResponseDto {
  final String id;
  final String gradeId;
  final DateTime startDate;
  final DateTime endDate;
  final double grade;
  final int correctAnswers;
  final int wrongAnswers;
  final List<GradeAssessmentQuestionResponse> questions;

  GradeAssessmentResponseDto(
      {required this.gradeId,
      required this.id,
      required this.startDate,
      required this.endDate,
      required this.grade,
      required this.correctAnswers,
      required this.wrongAnswers,
      required this.questions});

  GradeAssessmentResponseDto.fromJson(dynamic json)
      : this(
            gradeId: json["gradeId"],
            id: json["id"],
            startDate: DateTime.parse(json["startDate"]),
            endDate: DateTime.parse(json["endDate"]),
            grade: json["grade"] * 1.0,
            correctAnswers: json["correctAnswers"],
            wrongAnswers: json["wrongAnswers"],
            questions: (json["answers"] as Iterable)
                .map((it) => GradeAssessmentQuestionResponse.fromJson(it))
                .toList());

  @override
  String toString() {
    return """GradeAssessmentResponseDto {
      id: $id, 
      gradeId: $gradeId,
      startDate: $startDate, 
      endDate: $endDate, 
      grade: $grade, 
      correctAnswers: $correctAnswers, 
      wrongAnswers: $wrongAnswers,
      questions: $questions
    }
    """;
  }
}
