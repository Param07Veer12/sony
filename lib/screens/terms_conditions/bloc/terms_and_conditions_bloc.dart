import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:sony/network/network_class.dart';
import 'package:sony/network/network_response.dart';

import '../../../network/response_error.dart';
import '../../../network/web_urls.dart';
import '../../../utils/common_widgets/constants.dart';

part '../view/terms_and_conditions_event.dart';
part 'terms_and_conditions_state.dart';

class TermsAndConditionsBloc extends Bloc<TermsAndConditionsEvent, TermsAndConditionsState>  implements NetworkResponse {
  TermsAndConditionsBloc({required BuildContext context}) : _context = context ,  super(TermsAndConditionsState(termConditions: 'Loading...')) {
    on<TermsAndConditionsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
      final BuildContext _context;

  onChangedValue(bool value)
  {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state.copyWith(isChecked: value));
  }
  
        final EncryptedSharedPreferences encryptedSharedPreferences =
      EncryptedSharedPreferences();

   callGetTermsApi()

 async {
           encryptedSharedPreferences.getString(ROLE_CODE).then((String roleCode)  {
encryptedSharedPreferences.getString(ID).then((String id)  async {
     Map<String, dynamic> map = {
  "roleCode" :  roleCode,
 "userId" : id
    };

        await Future.delayed(const Duration(seconds: 1)); // This is to simulate that above checking process

    NetworkClass.fromNetworkClass(postGetTermCondition, this, reqPostGetTermCondition, map)
        .callPostServiceToken(_context, true);
           });
              });
  }
   
    onSubmitValue()
 async {
          
encryptedSharedPreferences.getString(ID).then((String id)  async {
      Map<String, dynamic> map = {
  "formData": {
    "isTermsCondition": true
  },
  "userExtraInfo": {
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
  }
};


    NetworkClass.fromNetworkClass(postAcceptTermCondition, this, reqPostAcceptTermCondition, map)
        .callPatchServiceToken(_context, true,id);
           });
           
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
        case reqPostGetTermCondition:
          var responseData = jsonDecode(response);
          print(responseData);
           switch (responseData["responseCode"]) {
            case "200":
             var responseMain = responseData['responseData'];
              var stringTerms = responseMain["termsConditionMessage"];
              emit(state.copyWith(
                  termConditions: stringTerms));
              break;
            default:
              print("error in response-------->");
              emit(state.copyWith(
                  success: false,isError : true, errorMessage: responseData["responseMessage"]));
          }
          case reqPostAcceptTermCondition:
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
