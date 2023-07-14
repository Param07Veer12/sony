class ChangePasswordState {

  const ChangePasswordState({
    this.userName = "",
    this.isError = false,
    this.errorMessage,
    this.success = false,
  });

  final bool isError;
  final String? errorMessage;
  final String? userName;
  final bool success;


  ChangePasswordState copyWith({
    bool? isError,
    String? errorMessage,
    bool? success,
    String? userName,
  }) {
    return ChangePasswordState(
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      success: success ?? this.success,
      userName: userName ?? this.userName,

    );
  }
}


  ChangePasswordState init() {
    return ChangePasswordState();
  }

  ChangePasswordState clone() {
    return ChangePasswordState();
  }

