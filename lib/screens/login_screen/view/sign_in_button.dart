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
        child: Padding(
          padding: EdgeInsets.only(left: 20,right: 20),
          child: ElevatedButton(
            onPressed: /*state.mobileNumber==""? ()=>context.read<SignInCubit>().checkMobileNumberValidation():*/
            //state.notValidNumber?null
             ()=> 
            //  print("sdkbhj"),
            (state.userName != "") && (state.password != "") ? context.read<LoginScreenBloc>().callLoginApi() : print("fef"),
            child:  Text("Login",style:  TextStyle(color: (state.userName != "") && (state.password != "") ? Colors.white : Colors.grey,fontSize: 17),),
            style: ButtonStyle(
                backgroundColor: (state.userName != "") && (state.password != "") ? MaterialStatePropertyAll(customMaterialColor(themeColor)) : MaterialStatePropertyAll(customMaterialColor(Colors.grey.shade50)),
                fixedSize: MaterialStateProperty.all(const Size.fromHeight(50)),
                shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))))),
          ),
        ),
      );
    } );
  }
}