

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sony/screens/login_screen/bloc/login_screen_bloc.dart';
import 'package:sony/utils/common_widgets/colors_used/colors_used.dart';

import '../../../utils/common_widgets/app_logo.dart';
import '../../../utils/common_widgets/custom_divider.dart';
import '../../../utils/common_widgets/label_heading.dart';
import '../../../utils/common_widgets/screen_heading.dart';
import '../../../utils/common_widgets/text_field_outline_border.dart';
import 'package:sony/utils/common_widgets/colors_used/colors_used.dart';

part 'login_page.dart';
part 'mobile_number_text_form_field.dart';
part 'sign_in_button.dart';
part 'password_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ListView(
                padding: const EdgeInsets.all(0),
                physics: const BouncingScrollPhysics(),
                //mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  CustomDivider(height: MediaQuery.of(context).size.height / 7),
                  const AppLogo(),
                  CustomDivider(height: MediaQuery.of(context).size.height / 5),
                  const ScreenHeading(heading: "Log In"),
                  const CustomDivider(height: 20),
                  const _SignInForm(),
                  const CustomDivider(height: 10),
                  // const _ForgetPassword(),
                ],
              ),
            ),);
  }
}