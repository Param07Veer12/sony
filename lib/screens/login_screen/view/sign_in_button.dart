part of'login_screen.dart';
class _SignInButton extends StatelessWidget {
  const _SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginScreenBloc,LoginScreenState>(
     //   buildWhen: (previous, current) => previous.notValidNumber!=current.notValidNumber,
        builder: (context, state) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: /*state.mobileNumber==""? ()=>context.read<SignInCubit>().checkMobileNumberValidation():*/
          //state.notValidNumber?null
           ()=> print("sdkbhj"),
           //context.read<SignInCubit>().callValidateLoginApi(),
          child: const Text("Log In",style: TextStyle(color: Colors.white)),
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(customMaterialColor(themeColor)),
              fixedSize: MaterialStateProperty.all(const Size.fromHeight(50)),
              shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))))),
        ),
      );
    } );
  }
}