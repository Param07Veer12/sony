part of 'forgot_password.dart';


class _ForgotForm extends StatelessWidget {
  const _ForgotForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        const CustomDivider(height: 40 ),
        _ForgotInButton(),
        SizedBox(height: 10,)
      ],
    ));
  }
}

class _ForgotPassworddButton extends StatelessWidget {
  const _ForgotPassworddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
     BlocBuilder<ForgotPasswordBloc,ForgotPasswordState>(
     //   buildWhen: (previous, current) => previous.notValidNumber!=current.notValidNumber,
        builder: (context, state) {
      return Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          
          width: 205,
          child: ElevatedButton(
            onPressed: /*state.mobileNumber==""? ()=>context.read<SignInCubit>().checkMobileNumberValidation():*/
            //state.notValidNumber?null
             ()=> print("sdkbhj"),
             //context.read<SignInCubit>().callValidateLoginApi(),
            child: const Text("Forgot Password?",style: TextStyle(color: themeColor,fontSize: 18),textAlign: TextAlign.right,),
            style: ButtonStyle(
                 backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                 shadowColor: MaterialStatePropertyAll(Colors.transparent),
                 foregroundColor: MaterialStatePropertyAll(Colors.transparent),
                 surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
      
                fixedSize: MaterialStateProperty.all(const Size.fromHeight(30)),
                shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))))),
          ),
        ),
      );
    } );
  }
}