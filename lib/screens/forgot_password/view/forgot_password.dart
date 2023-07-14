

import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sony/screens/forgot_password/forgot_password/bloc.dart';
import 'package:sony/screens/forgot_password/forgot_password/state.dart';
import 'package:sony/screens/otp_screen/bloc/otp_screen_bloc.dart';
import 'package:sony/utils/common_widgets/colors_used/colors_used.dart';

import '../../../utils/common_widgets/app_logo.dart';
import '../../../utils/common_widgets/custom_divider.dart';
import '../../../utils/common_widgets/label_heading.dart';
import '../../../utils/common_widgets/screen_heading.dart';
import '../../../utils/common_widgets/text_field_outline_border.dart';
import '../../otp_screen/view/otp_screen.dart';
import '../../pop_up/view/pop_up_view.dart';

part 'forgot_page.dart';
part 'forgot_text_form_field.dart';
part 'forgot_in_button.dart';
class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {

  final EncryptedSharedPreferences encryptedSharedPreferences =
  EncryptedSharedPreferences();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
        listener: (context, state) {
          if (state.isError) {

            Navigator.of(context).push(PageRouteBuilder(
                opaque: false,
                pageBuilder: (BuildContext context, _, __) => PopUpView(
                  popUpTitle: state.errorMessage??"",
                  voidCallback: () {
                    Navigator.pop(context);
                  },
                )));
          } else if (state.success) {

            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
              return BlocProvider(
                create: (context)=>OtpScreenBloc(context: context),
                child:const OtpScreen() ,
              );
            }), (route) => false);


          }
       },
        child:  Scaffold(body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ListView(
            padding: const EdgeInsets.all(0),
            physics: const BouncingScrollPhysics(),
            //mainAxisAlignment: MainAxisAlignment.start,

            children: [
              CustomDivider(height: MediaQuery.of(context).size.height / 7),
              const AppLogo(),
              CustomDivider(height: MediaQuery.of(context).size.height / 15),
              const ScreenHeading(heading: "Forgot Password?"),
              const CustomDivider(height: 30),
              const LabelHeading(labelHeading: "Username"),
              _EnterTextFromField(),
              const CustomDivider(height: 20),
              const _ForgotForm(),
              const CustomDivider(height: 10),
             const _BackToLoginButton(),
            ],
          ),
        ),));
  }
}