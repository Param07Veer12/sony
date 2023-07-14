import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:sony/network/network_class.dart';
import 'package:sony/network/network_response.dart';

import '../../../network/web_urls.dart';

part '../view/terms_and_conditions_event.dart';
part 'terms_and_conditions_state.dart';

class TermsAndConditionsBloc extends Bloc<TermsAndConditionsEvent, TermsAndConditionsState>  implements NetworkResponse {
  TermsAndConditionsBloc({required BuildContext context}) : _context = context ,  super(TermsAndConditionsState()) {
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
   onSubmitValue()
  {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state.copyWith(success: true));
  }
   callGetTermsApi()
  {
     Map<String, dynamic> map = {
  
 
    };
    NetworkClass.fromNetworkClass(postValidateOtp, this, reqPostValidateOtp, map)
        .callPostServiceToken(_context, true);
  }
  
  @override
  void onHTTPError({required int requestCode, required String response}) {
    // TODO: implement onHTTPError
  }
  
  @override
  void onHTTPResponse({required int requestCode, required String response}) {
    // TODO: implement onHTTPResponse
  }
  
  @override
  void onNoInternetAndServerError({required String message}) {
    // TODO: implement onNoInternetAndServerError
  }
}
