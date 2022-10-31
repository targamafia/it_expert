class UserDto {
  final String? userId;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? companyCode;
  final String? token;

  UserDto(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.companyCode,
      required this.token});

  @override
  String toString() {
    return 'UserDto{userId: $userId, firstName: $firstName, lastName: $lastName, email: $email, companyCode: $companyCode, token: $token}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDto &&
          runtimeType == other.runtimeType &&
          userId == other.userId;

  @override
  int get hashCode => userId.hashCode;
}
