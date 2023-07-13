part of 'login_screen_bloc.dart';


 class LoginScreenState {

  const LoginScreenState({
    this.userName = "",
    this.password = "",
    this.isError = false,
    this.passwordVisible = false,
    this.errorMessage,
    this.success=false,
    this.logInDataModel
  });

  final bool isError;
  final String? errorMessage;
  final String? userName;
  final String? password;
  final bool success;
  final LoginModel? logInDataModel;
  final bool passwordVisible;

LoginScreenState copyWith({
    bool? isError,
    String? errorMessage,
    bool? success,
    LoginModel? logInDataModel,
    String? userName,
    String? password,
    bool? passwordVisible,


  }) {
    return LoginScreenState(
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      success: success?? this.success,
      logInDataModel:logInDataModel??this.logInDataModel,
      userName:userName??this.userName,
      password:password??this.password,
      passwordVisible:passwordVisible??this.passwordVisible
    );
  }

}

class LoginScreenInitial extends LoginScreenState {}

class LoginSucess extends LoginScreenState {}
