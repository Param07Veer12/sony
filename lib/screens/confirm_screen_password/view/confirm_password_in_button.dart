part of 'view.dart';


  class _BackToLoginButton extends StatelessWidget {
    const _BackToLoginButton({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return
        BlocBuilder<ConfirmPasswordScreenBloc, ConfirmPasswordScreenState>(
          //   buildWhen: (previous, current) => previous.notValidNumber!=current.notValidNumber,
            builder: (context, state) {
              return Center(
                child: SizedBox(
                  width: 160,
                  child: ElevatedButton(
                    onPressed: /*state.mobileNumber==""? ()=>context.read<SignInCubit>().checkMobileNumberValidation():*/
                    //state.notValidNumber?null
                        () => print("sdkbhj"),
                    //context.read<SignInCubit>().callValidateLoginApi(),
                    child: const Text("Back to Login", style: TextStyle(
                        color: themeColor,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                        decorationColor: themeColor),),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Colors.transparent),
                        shadowColor: MaterialStatePropertyAll(
                            Colors.transparent),
                        foregroundColor: MaterialStatePropertyAll(
                            Colors.transparent),
                        surfaceTintColor: MaterialStatePropertyAll(
                            Colors.transparent),

                        fixedSize: MaterialStateProperty.all(
                            const Size.fromHeight(50)),
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(4))))),
                  ),
                ),
              );
            });
    }
  }
