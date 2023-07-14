import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:sony/utils/common_widgets/constants.dart';

import '../../../network/network_class.dart';
import '../../../network/network_response.dart';
import '../../../network/response_error.dart';
import '../../../network/web_urls.dart';

part 'otp_screen_event.dart';
part 'otp_screen_state.dart';

class OtpScreenBloc extends Bloc<OtpScreenEvent, OtpScreenState> implements NetworkResponse {
  OtpScreenBloc({required BuildContext context}) : _context = context , super(OtpScreenState()) {
    on<OtpScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
      final BuildContext _context;

      final EncryptedSharedPreferences encryptedSharedPreferences =
      EncryptedSharedPreferences();


setUpInitialData()
{
    // encryptedSharedPreferences.getString(OTP_REF_ID).then((String value) {
        
    //     emit(state.copyWith(
    //     otpReferanceId: value,
    // )); 
    //       });  
}
  callValidateLoginApi()
  {
        encryptedSharedPreferences.getString(OTP_REF_ID).then((String value) {

       Map<String, dynamic> map = {
      "formData": {
    "otpReferanceId":value,
    "otp":state.otp
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
    NetworkClass.fromNetworkClass(postValidateOtp, this, reqPostValidateOtp, map)
        .callPostServiceToken(_context, true);
    // emit(state.copyWith(
    //   success: true,
    //   isError: false,
    // )); 

 });  

     }



    void onOtpChange(String value) {
    final otp = value;
    emit(state.copyWith(
      otp: value,
      success: false,
      isError: false,
      isValidOtp: otp.length < 6 ? false : true,
    ));
  }

   @override
  void onHTTPError({required int requestCode, required String response}) {
    try {
      throw const ResponseError();
    } on ResponseError catch (e) {
      emit(state.copyWith(success: false,isError : true, errorMessage: e.message));
    }
  }
  
  @override
  void onHTTPResponse({required int requestCode, required String response}) {
      switch (requestCode) {
        case reqPostValidateOtp:
          var responseData = jsonDecode(response);
          print(responseData);
           switch (responseData["responseCode"]) {
            case "200":
              emit(state.copyWith(
                  success: true));
              break;
            default:
              print("error in response-------->");
              emit(state.copyWith(
                  success: false,isError : true, errorMessage: responseData["responseMessage"]));
          }
      }
    
  }
  
  @override
  void onNoInternetAndServerError({required String message}) {
    emit(state.copyWith(success: false,isError: true, errorMessage: message));
  }
}
