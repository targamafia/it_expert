class GradedAssessmentDto {
  final String id;
  final DateTime startDate;
  final DateTime endDate;
  final double grade;
  final int correctAnswers;
  final int wrongAnswers;

  GradedAssessmentDto(
      {required this.id,
      required this.startDate,
      required this.endDate,
      required this.grade,
      required this.correctAnswers,
      required this.wrongAnswers});
}
