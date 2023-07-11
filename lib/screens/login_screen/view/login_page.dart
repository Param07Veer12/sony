part of 'login_screen.dart';


class _SignInForm extends StatelessWidget {
  const _SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        LabelHeading(labelHeading: "User Name"),
        _EnterMobileTextFromField(),
        CustomDivider(height: 10),
        LabelHeading(labelHeading: "Password"),
        _EnterPasswordTextFromField(),
        CustomDivider(height: 60),
        _SignInButton(),
        SizedBox(height: 50,)
      ],
    ));
  }
}