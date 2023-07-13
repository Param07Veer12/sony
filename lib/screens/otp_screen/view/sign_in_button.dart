part of'otp_screen.dart';
class _SignInButton extends StatelessWidget {
  const _SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
     BlocBuilder<OtpScreenBloc,OtpScreenState>(
     //   buildWhen: (previous, current) => previous.notValidNumber!=current.notValidNumber,
        builder: (context, state) {
      return SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(left: 20,right: 20),
          child: ElevatedButton(
            onPressed: /*state.mobileNumber==""? ()=>context.read<SignInCubit>().checkMobileNumberValidation():*/
            //state.notValidNumber?null
             ()=> 
             
             context.read<OtpScreenBloc>().callValidateLoginApi(),
            child:  Text("Submit",style: TextStyle(color: state.isValidOtp == true ? Colors.white : Colors.grey,fontSize: 18)),
            style: ButtonStyle(
                backgroundColor: state.isValidOtp == true ? MaterialStatePropertyAll(customMaterialColor(themeColor)) : MaterialStatePropertyAll(customMaterialColor(Colors.grey.shade50)),
                fixedSize: MaterialStateProperty.all(const Size.fromHeight(50)),
                shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))))),
          ),
        ),
      );
    } );
  }
}

class _ResendButton extends StatelessWidget {
  const _ResendButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
     BlocBuilder<LoginScreenBloc,LoginScreenState>(
     //   buildWhen: (previous, current) => previous.notValidNumber!=current.notValidNumber,
        builder: (context, state) {
      return Center(
        child: SizedBox(
          width: 160,
          child: ElevatedButton(
            onPressed: /*state.mobileNumber==""? ()=>context.read<SignInCubit>().checkMobileNumberValidation():*/
            //state.notValidNumber?null
             ()=> print("sdkbhj"),
             //context.read<SignInCubit>().callValidateLoginApi(),
            child: const Text("Resend OTP",style: TextStyle(color: themeColor,fontSize: 18, decoration: TextDecoration.underline,decorationColor: themeColor),),
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                 shadowColor: MaterialStatePropertyAll(Colors.transparent),
                 foregroundColor: MaterialStatePropertyAll(Colors.transparent),
                 surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
      
                fixedSize: MaterialStateProperty.all(const Size.fromHeight(50)),
                shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))))),
          ),
        ),
      );
    } );
  }
}