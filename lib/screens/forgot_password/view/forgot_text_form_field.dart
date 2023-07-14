part of 'forgot_password.dart';

class _EnterTextFromField extends StatelessWidget {
  _EnterTextFromField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
   //     buildWhen: (previous, current) => previous.mobileNumber != current.mobileNumber,
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Material(
                           color: Colors.transparent,
              // elevation: 5.0,
              //   shadowColor: Colors.grey,

              child: TextFormField(
                textInputAction: TextInputAction.done,
                cursorColor: Colors.black,
                onChanged: (userName) =>
                print("ll"),
                  //  context.read<ForgotPasswordBloc>().onUserNameChange(userName),
                decoration: InputDecoration(
                  prefixIcon:  Icon(Icons.person),
                  hintText: 'Enter username ',
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
              ),
            ),
          );
        });
  }
}
