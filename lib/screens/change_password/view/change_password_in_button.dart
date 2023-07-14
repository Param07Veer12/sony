part of 'change_password.dart';

class _ChangePasswordInButton extends StatelessWidget {
  const _ChangePasswordInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(

        builder: (context, state) {
          return SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                onPressed: /*state.mobileNumber==""? ()=>context.read<SignInCubit>().checkMobileNumberValidation():*/
                //state.notValidNumber?null
                    () =>
                    print("sdkbhj"),
                //  (state.userName != "") ? context.read<ForgotPasswordBloc>().callLoginApi() : print("fef"),
                child: Text("Submit", style: TextStyle(
                    color: (state.userName != "") ? Colors.white : Colors.grey,
                    fontSize: 17),),
                style: ButtonStyle(
                    backgroundColor: (state.userName != "")
                        ? MaterialStatePropertyAll(
                        customMaterialColor(themeColor))
                        : MaterialStatePropertyAll(
                        customMaterialColor(Colors.grey.shade50)),
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
  class _BackToLoginButton extends StatelessWidget {
    const _BackToLoginButton({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return
        BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
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
