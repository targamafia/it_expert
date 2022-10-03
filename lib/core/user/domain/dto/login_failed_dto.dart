class LoginFailedException implements Exception {
  final String errorMessage;
  final String errorCode;

  LoginFailedException({required this.errorMessage, required this.errorCode});

  @override
  String toString() {
    return 'LoginFailedDto{errorMessage: $errorMessage, errorCode: $errorCode}';
  }
}
