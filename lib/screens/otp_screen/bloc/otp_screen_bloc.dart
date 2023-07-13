import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'otp_screen_event.dart';
part 'otp_screen_state.dart';

class OtpScreenBloc extends Bloc<OtpScreenEvent, OtpScreenState> {
  OtpScreenBloc() : super(OtpScreenState()) {
    on<OtpScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  callValidateLoginApi()
  {
    emit(state.copyWith(
      success: true,
      isError: false,
    ));  }
    void onOtpChange(String value) {
    final otp = value;
    emit(state.copyWith(
      otp: value,
      success: false,
      isError: false,
      isValidOtp: otp.length < 6 ? false : true,
    ));
  }
}
