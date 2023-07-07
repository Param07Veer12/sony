

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:sony/screens/login_screen/bloc/login_screen_bloc.dart';
import 'package:sony/screens/otp_screen/bloc/otp_screen_bloc.dart';
import 'package:sony/screens/welcome_screen/bloc/welcome_screen_bloc.dart';
import 'package:sony/screens/welcome_screen/view/welcome_screen.dart';
import 'package:sony/utils/common_widgets/colors_used/colors_used.dart';

import '../../../utils/common_widgets/app_logo.dart';
import '../../../utils/common_widgets/custom_divider.dart';
import '../../../utils/common_widgets/label_heading.dart';
import '../../../utils/common_widgets/screen_heading.dart';
import '../../../utils/common_widgets/text_field_outline_border.dart';
import 'package:sony/utils/common_widgets/colors_used/colors_used.dart';

import '../../home_screen/bloc/home_screen_bloc.dart';
import '../../home_screen/view/home_screen.dart';

part 'login_page.dart';
part 'mobile_number_text_form_field.dart';
part 'sign_in_button.dart';
part 'password_text_form_field.dart';
part 'otp_widget.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers: [
          BlocProvider<LoginScreenBloc>(create: (_) => LoginScreenBloc()),
          BlocProvider<OtpScreenBloc>(create: (_) => OtpScreenBloc())
        ],
        child: BlocListener<OtpScreenBloc, OtpScreenState>(
         listener: (context, state) {
        if (state is OtpSucess) {
         
   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
                  return BlocProvider(
                    create: (context)=>HomeScreenBloc(),
                    child:const HomeScreen() ,
                  );
                }), (route) => false);
                          }else{
            // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
            //   return BlocProvider(
            //     create:(context)=>InboxScreenBloc(context),
            //     child:const InboxScreen(),
            //   );
            // }), (route) => false);
             }
        
        

      },
      child: Scaffold(body: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ListView(
                padding: const EdgeInsets.all(0),
                physics: const BouncingScrollPhysics(),
                //mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  CustomDivider(height: MediaQuery.of(context).size.height / 7),
                  const AppLogo(),
                  const CustomDivider(height: 40),
                  const ScreenHeading(heading: "Log In"),
                   const CustomDivider(height: 20),
                  const LabelMain(labelHeading: "By signing in you agreeing to our"),
                  const LabelTermsAndCondition(labelHeading: "Terms and privacy policy"),
                  const CustomDivider(height: 60),
                  const _SignInForm(),
                  const CustomDivider(height: 10),
                  // const _ForgetPassword(),
                ],
              ),
            ),)));
  }
}