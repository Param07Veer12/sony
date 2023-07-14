part of 'change_password.dart';


class _ChangeForm extends StatelessWidget {
  const _ChangeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        const CustomDivider(height: 40 ),
        _ChangePasswordInButton(),
        SizedBox(height: 10,)
      ],
    ));
  }
}

