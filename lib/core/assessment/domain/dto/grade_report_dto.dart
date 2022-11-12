class GradeReportDto {
  String assessmentId;
  int remainingAttemps;
  bool isAvailable;
  double bestGrade;

  GradeReportDto(
      {required this.assessmentId,
      required this.remainingAttemps,
      required this.isAvailable,
      required this.bestGrade});
}
