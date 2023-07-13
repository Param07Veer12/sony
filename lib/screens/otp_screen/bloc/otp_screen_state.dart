part of 'otp_screen_bloc.dart';


//,this.otpDataModel
class OtpScreenState {
   OtpScreenState({this.otp = "", this.isValidOtp = false, this.isError = false, this.errorMessage,this.success=false});

  final String otp;
  final bool isValidOtp;
  final bool isError;
  final String? errorMessage;
  final bool success;
  // final OtpDataModel? otpDataModel;

  OtpScreenState copyWith({
    String? otp,
    bool? isValidOtp,
    bool? isError,
    String? errorMessage,
    bool? success,
    // OtpDataModel? otpDataModel,

  }) {
    return OtpScreenState(
      otp: otp ?? this.otp,
      isValidOtp: isValidOtp ?? this.isValidOtp,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      success:success ?? this.success,
        // otpDataModel:otpDataModel?? this.otpDataModel
    );
  }
}