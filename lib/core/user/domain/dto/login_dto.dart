class LoginDto {
  final String userId;
  final String name;
  final String lastName;
  final String email;
  final String companyCode;
  final String token;

  LoginDto(
      {required this.userId,
      required this.name,
      required this.lastName,
      required this.email,
      required this.companyCode,
      required this.token});

  @override
  String toString() {
    return 'LoginDto{userId: $userId, name: $name, lastName: $lastName, email: $email, companyCode: $companyCode, token: $token}';
  }
}
