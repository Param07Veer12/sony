part of 'otp_screen_bloc.dart';


//,this.otpDataModel
class OtpScreenState {
   OtpScreenState({this.otpReferanceId = "" ,this.otp = "", this.isValidOtp = false, this.isError = false, this.errorMessage,this.success=false,this.mobile = ""});
  final String otpReferanceId;
  final String otp;
  final bool isValidOtp;
  final bool isError;
  final String? errorMessage;
  final bool success;
  final String mobile;

  // final OtpDataModel? otpDataModel;

  OtpScreenState copyWith({
    String? otpReferanceId,
    String? otp,
    bool? isValidOtp,
    bool? isError,
    String? errorMessage,
    bool? success,
    String? mobile
    // OtpDataModel? otpDataModel,

  }) {
    return OtpScreenState(
      otpReferanceId : otpReferanceId ?? this.otpReferanceId,
      otp: otp ?? this.otp,
      isValidOtp: isValidOtp ?? this.isValidOtp,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      success:success ?? this.success,
      mobile: mobile ?? this.mobile
        // otpDataModel:otpDataModel?? this.otpDataModel
    );
  }
}