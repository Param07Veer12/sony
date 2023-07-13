part of 'login_screen.dart';


class _SignInForm extends StatelessWidget {
  const _SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        LabelHeading(labelHeading: "Username"),
        _EnterMobileTextFromField(),
        CustomDivider(height: 40),
        LabelHeading(labelHeading: "Password"),
        _EnterPasswordTextFromField(),
        CustomDivider(height: 100 ),
        _SignInButton(),
        SizedBox(height: 50,)
      ],
    ));
  }
}