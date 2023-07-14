import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/common_widgets/app_logo.dart';
import '../../../utils/common_widgets/colors_used/colors_used.dart';
import '../../../utils/common_widgets/custom_divider.dart';
import '../../../utils/common_widgets/screen_heading.dart';
import '../confirm_password_screen/bloc.dart';
import '../confirm_password_screen/event.dart';
import '../confirm_password_screen/state.dart';
part 'confirm_password_in_button.dart';
class ConfirmChangePasswordScreen extends StatefulWidget {
  const ConfirmChangePasswordScreen({super.key});

  @override
  State<ConfirmChangePasswordScreen> createState() => _ConfirmChangePasswordScreenState();
}

class _ConfirmChangePasswordScreenState extends State<ConfirmChangePasswordScreen> {



  @override
  Widget build(BuildContext context) {
    return BlocListener<ConfirmPasswordScreenBloc, ConfirmPasswordScreenState>(
        listener: (context, state)
    {

    },
     child:
      Scaffold(body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          padding: const EdgeInsets.all(0),
          physics: const BouncingScrollPhysics(),
          //mainAxisAlignment: MainAxisAlignment.start,

          children: [
            CustomDivider(height: MediaQuery
                .of(context)
                .size
                .height / 7),
            const AppLogo(),
            CustomDivider(height: MediaQuery
                .of(context)
                .size
                .height / 15),
            const ScreenHeading(heading: "Change Password!"),
            const CustomDivider(height: 30),
            const ScreenBlackTextConfrimHeading(
                heading: "Password changed successfully !"),
            const CustomDivider(height: 30),
            const _BackToLoginButton(),
          ],
        ),
      ),));
    }
}
