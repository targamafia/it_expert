
class UserStatsDto{
  final int? premiumAssessments;
  final int? takenAssessments;

  UserStatsDto(
      {required this.premiumAssessments,
        required this.takenAssessments});

  @override
  String toString() {
    return 'UserStatsDtp{premiumAssessments: $premiumAssessments, takenAssessments: $takenAssessments}';
  }
}