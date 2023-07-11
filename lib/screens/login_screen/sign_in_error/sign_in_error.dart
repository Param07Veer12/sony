class SignInError implements Exception {
  final String message;

  const SignInError([this.message = "Unknown error occurred."]);

  factory SignInError.fromStatus(String statusCode, String errorMessage) {
    switch (statusCode) {
      case "0":
        return SignInError(errorMessage);
      default:
        return const SignInError();
    }
  }
}