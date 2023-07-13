import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:sony/network/network_response.dart';
import 'package:sony/screens/login_screen/model/login_model.dart';
import 'package:sony/screens/login_screen/sign_in_error/sign_in_error.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import '../../../network/network_class.dart';
import '../../../network/web_urls.dart';
part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> implements NetworkResponse{
  LoginScreenBloc({required BuildContext context}) : _context = context,super( LoginScreenInitial());

    final BuildContext _context;
  late LoginModel _logInDataModel;


 void callLoginApi() async {

if (state.userName == "")
{

  emit(state.copyWith(isError: true, errorMessage: "Please enter User name"));
}
else if  (state.password == "")
{

  emit(state.copyWith(isError: true, errorMessage: "Please enter password"));
}
else
{

      Map<String, dynamic> map = {
      "formData": {
    "userName":state.userName ?? "",
    "password":state.password ?? ""
      },
      "userExtraInfo": 
      {
    "deviceId": "",
    "deviceName": "",
    "appVersion": "",
    "osType": "",
    "osVersion": "",
    "osVersionName": "",
    "ipAddress": "",
    "language": "",
    "screenName": "",
    "networkType": "",
    "networkOperator": "",
    "timeCaptured": "",
    "channel": "",
    "browser": "",
    "browserVersion": ""
      },
    };
      NetworkClass.fromNetworkClass(postLoginApi, this, reqPostLogin, map).callPostService(_context, true);
}
  }
    void onUserNameChange(String value) {
    final name = value;
    emit(state.copyWith(
        userName: name, isError: false, success: false));
  }
      void onPasswordChange(String value) {
    final pass = value;
    emit(state.copyWith(
        password: pass, isError: false, success: false));
  }
   void onPasswordVisibleChange(bool value) {
    emit(state.copyWith(
        passwordVisible: value, isError: false, success: false));
  }
  @override
  void onHTTPError({required int requestCode, required String response}) {
    // TODO: implement onHTTPError
  }
  
  @override
  void onHTTPResponse({required int requestCode, required String response}) {
       try {
      switch (requestCode) {
        case reqPostLogin:
          _logInDataModel = LoginModel.fromJson(jsonDecode(response));
          switch (_logInDataModel.status) {
            case 0:
              throw SignInError.fromStatus(_logInDataModel.status.toString(), _logInDataModel.responseMessage ?? "");
            case 1:
              emit(state.copyWith(success: true, logInDataModel: _logInDataModel, isError: false));
              break;
            default:
              throw const SignInError();
          }
      }
    } on SignInError catch (e) {
      emit(state.copyWith(isError: true, errorMessage: e.message));
    }
  }
  
  @override
  void onNoInternetAndServerError({required String message}) {
    emit(state.copyWith(isError: true, errorMessage: message));
  }
  
}
