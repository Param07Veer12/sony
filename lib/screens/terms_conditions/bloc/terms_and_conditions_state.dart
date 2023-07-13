part of 'terms_and_conditions_bloc.dart';

class TermsAndConditionsState {
     TermsAndConditionsState({this.isChecked = false,this.success = false});

   bool isChecked = false;
   bool success = false;
  // final OtpDataModel? otpDataModel;

  TermsAndConditionsState copyWith({
    bool? isChecked,
    bool? success,
    // OtpDataModel? otpDataModel,

  }) {
    return TermsAndConditionsState(
      isChecked: isChecked ?? this.isChecked,
      success : success ?? this.success
        // otpDataModel:otpDataModel?? this.otpDataModel
    );
  }
}


