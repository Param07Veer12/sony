part of 'change_password.dart';

class _EnterPrviousTextFromField extends StatelessWidget {
  _EnterPrviousTextFromField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
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
                  hintText: '| Enter Temporary Password ',
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
class _EnterNewPasswordTextFromField extends StatelessWidget {
  _EnterNewPasswordTextFromField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
      //     buildWhen: (previous, current) => previous.mobileNumber != current.mobileNumber,
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Material(
              color: Colors.transparent,
              // elevation: 5.0,
              //   shadowColor: Colors.grey,

              child: TextFormField(
                // obscureText: state.passwordVisible,
                textInputAction: TextInputAction.done,
                cursorColor: Colors.black,
                onChanged: (password) =>
                      print("dd"),
                    // context.read<ChangePasswordBloc>().onPasswordChange(password),

                decoration: InputDecoration(
                  prefixIcon:  Icon(Icons.key),
                  hintText: 'New Password',
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: const EdgeInsets.all(15),
                  focusedBorder: buildOutlineInputBorder(),
                  disabledBorder: buildOutlineInputBorder(),
                  enabledBorder: buildOutlineInputBorder(),
                  errorBorder: buildOutlineInputBorder(),
                  focusedErrorBorder: buildOutlineInputBorder(),
                  border: buildOutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      // state.passwordVisible
                      //     ? Icons.visibility
                      //     :
                      Icons.visibility_off,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      // context.read<ChangePasswordBloc>().onPasswordVisibleChange(!state.passwordVisible);
                      // Update the state i.e. toogle the state of passwordVisible variable

                    },
                  ),

                  //     errorText: state.notValidNumber ? "Enter valid mobile number" : null
                ),
              ),
            ),
          );
        });
  }
}

class _EnterConfirmPasswordTextFromField extends StatelessWidget {
  _EnterConfirmPasswordTextFromField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
      //     buildWhen: (previous, current) => previous.mobileNumber != current.mobileNumber,
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Material(
              color: Colors.transparent,
              // elevation: 5.0,
              //   shadowColor: Colors.grey,

              child: TextFormField(
                // obscureText: state.passwordVisible,
                textInputAction: TextInputAction.done,
                cursorColor: Colors.black,
                onChanged: (password) =>
                    print("dd"),
                // context.read<ChangePasswordBloc>().onPasswordChange(password),

                decoration: InputDecoration(
                  prefixIcon:  Icon(Icons.key),
                  hintText: 'Confirm New Password',
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: const EdgeInsets.all(15),
                  focusedBorder: buildOutlineInputBorder(),
                  disabledBorder: buildOutlineInputBorder(),
                  enabledBorder: buildOutlineInputBorder(),
                  errorBorder: buildOutlineInputBorder(),
                  focusedErrorBorder: buildOutlineInputBorder(),
                  border: buildOutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      // state.passwordVisible
                      //     ? Icons.visibility
                      //     :
                      Icons.visibility_off,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      // context.read<ChangePasswordBloc>().onPasswordVisibleChange(!state.passwordVisible);
                      // Update the state i.e. toogle the state of passwordVisible variable

                    },
                  ),

                  //     errorText: state.notValidNumber ? "Enter valid mobile number" : null
                ),
              ),
            ),
          );
        });
  }
}