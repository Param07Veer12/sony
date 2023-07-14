class ConfirmPasswordScreenState {
  const ConfirmPasswordScreenState({
    this.userName = "",
    this.isError = false,
    this.errorMessage,
    this.success = false,
  });

  final bool isError;
  final String? errorMessage;
  final String? userName;
  final bool success;


  ConfirmPasswordScreenState copyWith({
    bool? isError,
    String? errorMessage,
    bool? success,
    String? userName,
  }) {
    return ConfirmPasswordScreenState(
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      success: success ?? this.success,
      userName: userName ?? this.userName,

    );
  }
}


ConfirmPasswordScreenState init() {
    return ConfirmPasswordScreenState();
  }

  ConfirmPasswordScreenState clone() {
    return ConfirmPasswordScreenState();
  }

