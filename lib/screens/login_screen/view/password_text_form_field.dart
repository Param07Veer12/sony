part of 'login_screen.dart';

class _EnterPasswordTextFromField extends StatelessWidget {
   _EnterPasswordTextFromField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginScreenBloc, LoginScreenState>(
   //     buildWhen: (previous, current) => previous.mobileNumber != current.mobileNumber,
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Material(
                           color: Colors.transparent,
              // elevation: 5.0,
              //   shadowColor: Colors.grey,
          
              child: TextFormField(
                obscureText: state.passwordVisible,
                textInputAction: TextInputAction.done,
                cursorColor: Colors.black,
                onChanged: (password) =>
               
                context.read<LoginScreenBloc>().onPasswordChange(password),
                 
                decoration: InputDecoration(
                    prefixIcon:  Icon(Icons.key),
                    hintText: 'Enter password',
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
               state.passwordVisible
               ? Icons.visibility
              : 
               Icons.visibility_off,
               color: Colors.black,
               ),
            onPressed: () {
               context.read<LoginScreenBloc>().onPasswordVisibleChange(!state.passwordVisible);
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
