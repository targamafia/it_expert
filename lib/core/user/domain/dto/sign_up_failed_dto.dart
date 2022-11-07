class SignUpFailedException implements Exception {
  final String errorMessage;
  final String errorCode;

  SignUpFailedException({required this.errorMessage, required this.errorCode});

  @override
  String toString() {
    return 'SignUpFailedDto{errorMessage: $errorMessage, errorCode: $errorCode}';
  }
}
