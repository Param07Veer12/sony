part of 'otp_screen.dart';


class _SignInForm extends StatelessWidget {
  const _SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        LabelOtp(labelHeading: "Enter 6 - Digit OTP sent to your registered mobile number " ),
        CustomDivider(height: 20),
        LabelOtp(labelHeading: "Valid for Next 24 Hours"),
        CustomDivider(height: 20),
        _ResendButton(),
        CustomDivider(height: 20),
        _OtpWidget(),
        CustomDivider(height: 60),
        _SignInButton(),
        CustomDivider(height: 40),
      ],
    ));
  }
}