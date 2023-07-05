part of 'login_screen.dart';

class _EnterMobileTextFromField extends StatelessWidget {
  const _EnterMobileTextFromField({Key? key}) : super(key: key);

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
                hintText: '| Enter user name',
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
