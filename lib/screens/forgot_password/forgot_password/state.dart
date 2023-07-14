class ForgotPasswordState {
  const ForgotPasswordState({
    this.userName = "",
    this.isError = false,
    this.errorMessage,
    this.success = false,
  });

  final bool isError;
  final String? errorMessage;
  final String? userName;
  final bool success;


  ForgotPasswordState copyWith({
    bool? isError,
    String? errorMessage,
    bool? success,
    String? userName,
  }) {
    return ForgotPasswordState(
        isError: isError ?? this.isError,
        errorMessage: errorMessage ?? this.errorMessage,
        success: success ?? this.success,
        userName: userName ?? this.userName,

    );
  }
}





  ForgotPasswordState init() {
    return ForgotPasswordState();
  }

  ForgotPasswordState clone() {
    return ForgotPasswordState();
  }

