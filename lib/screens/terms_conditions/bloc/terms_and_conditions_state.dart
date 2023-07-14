part of 'terms_and_conditions_bloc.dart';

class TermsAndConditionsState {
     TermsAndConditionsState({this.isChecked = false,this.success = false, this.isError = false, this.errorMessage = "",this.termConditions = ""});

   bool isChecked = false;
   bool success = false;
   final bool isError;
  final String? errorMessage;
   final String? termConditions;

  // final OtpDataModel? otpDataModel;

  TermsAndConditionsState copyWith({
    bool? isChecked,
    bool? success,
     bool? isError,
    String? errorMessage,
    String? termConditions
    // OtpDataModel? otpDataModel,

  }) {
    return TermsAndConditionsState(
      isChecked: isChecked ?? this.isChecked,
      success : success ?? this.success,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      termConditions : termConditions ?? this.termConditions
        // otpDataModel:otpDataModel?? this.otpDataModel
    );
  }
}


