class GradedAssessmentDto {
  final String id;
  final DateTime startDate;
  final DateTime endDate;
  final double grade;
  final int correctAnswers;
  final int wrongAnswers;
  final String thumbnailUrl;
  final String title;

  GradedAssessmentDto(
      {required this.id,
      required this.startDate,
      required this.endDate,
      required this.grade,
      required this.correctAnswers,
      required this.wrongAnswers,
      required this.thumbnailUrl,
      required this.title});
}
