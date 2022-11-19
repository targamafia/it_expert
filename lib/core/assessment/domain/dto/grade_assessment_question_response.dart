class GradeAssessmentQuestionResponse {
  String questionId;
  String questionTitle;
  bool isCorrect;

  GradeAssessmentQuestionResponse(
      {required this.questionId,
      required this.questionTitle,
      required this.isCorrect});

  @override
  String toString() {
    return 'GradeAssessmentQuestionResponse{questionId: $questionId, questionTitle: $questionTitle, isCorrect: $isCorrect}';
  }

  GradeAssessmentQuestionResponse.fromJson(dynamic json)
      : this(
            questionId: json["_id"],
            questionTitle: json["question"]["title"],
            isCorrect: json["isCorrect"]);
}
