
part of'term_conditions.dart';

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TermsAndConditionsBloc,TermsAndConditionsState>(
     //   buildWhen: (previous, current) => previous.notValidNumber!=current.notValidNumber,
        builder: (context, state) {
      return SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(left: 0,right: 0),
          child: ElevatedButton(
            onPressed: /*state.mobileNumber==""? ()=>context.read<SignInCubit>().checkMobileNumberValidation():*/
            //state.notValidNumber?null
             ()=> 
            (state.isChecked == true ) ? context.read<TermsAndConditionsBloc>().onSubmitValue() : print("fef"),
            child:  Text("Submit",style:  TextStyle(color: Colors.white,fontSize: 17),),
            style: ButtonStyle(
                
                backgroundColor: (state.isChecked == true )  ? MaterialStatePropertyAll(customMaterialColor(themeColor)) 
                : MaterialStatePropertyAll(customMaterialColor(themeColor).withOpacity(0.5)),
                fixedSize: MaterialStateProperty.all(const Size.fromHeight(50)),
                shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))))),
          ),
        ),
      );
    } );
  }
}