part of 'login_screen.dart';

class _EnterPasswordTextFromField extends StatelessWidget {
  const _EnterPasswordTextFromField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginScreenBloc, LoginScreenState>(
   //     buildWhen: (previous, current) => previous.mobileNumber != current.mobileNumber,
        builder: (context, state) {
          return TextFormField(
            textInputAction: TextInputAction.done,
            cursorColor: Colors.black,
            onChanged: (mobileNumber) =>
            print(mobileNumber),
            // context.read<LoginScreenBloc>().onMobileNumberChange(mobileNumber)
             
            decoration: InputDecoration(
                hintText: '| Enter Password',
                fillColor: Colors.white,
                filled: true,
                contentPadding: const EdgeInsets.all(15),
                focusedBorder: buildOutlineInputBorder(),
                disabledBorder: buildOutlineInputBorder(),
                enabledBorder: buildOutlineInputBorder(),
                errorBorder: buildOutlineInputBorder(),
                focusedErrorBorder: buildOutlineInputBorder(),
                border: buildOutlineInputBorder(),
           //     errorText: state.notValidNumber ? "Enter valid mobile number" : null
                ),
          );
        });
  }
}