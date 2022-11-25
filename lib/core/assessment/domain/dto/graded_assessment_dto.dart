class GradedAssessmentDto {
  final String id;
  final String gradeId;
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
      required this.title,
      required this.gradeId});

  @override
  String toString() {
    return """GradedAssessmentDto {
      id: $id, 
      gradeId: $gradeId, 
      startDate: $startDate, 
      endDate: $endDate, 
      grade: $grade, 
      correctAnswers: $correctAnswers, 
      wrongAnswers: $wrongAnswers, 
      thumbnailUrl: $thumbnailUrl, 
      title: $title
    }""";
  }
}
