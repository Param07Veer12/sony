

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:sony/screens/login_screen/bloc/login_screen_bloc.dart';
import 'package:sony/screens/otp_screen/bloc/otp_screen_bloc.dart';
import 'package:sony/screens/terms_conditions/bloc/terms_and_conditions_bloc.dart';
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
import '../../pop_up/view/pop_up_view.dart';
import '../../terms_conditions/view/term_conditions.dart';

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
  void initState() {
    
 context.read<OtpScreenBloc>().setUpInitialData();
        // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers: [
          BlocProvider<LoginScreenBloc>(create: (_) => LoginScreenBloc(context: context)),
          BlocProvider<OtpScreenBloc>(create: (_) => OtpScreenBloc(context: context))
        ],
        child: BlocListener<OtpScreenBloc, OtpScreenState>(
         listener: (context, state) {

              if (state.isError == true) 
                {
    Navigator.of(context).push(PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (BuildContext context, _, __) => PopUpView(
                    popUpTitle: state.errorMessage??"",
                    voidCallback: () {
                      Navigator.pop(context);
                    },
                  )));
                }
        if (state.success == true) {
         
   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
                  return BlocProvider(
                    create: (context)=>WelcomeScreenBloc(),
                    child:const WelcomeScreen() ,
                  );
                }), (route) => false);
                }
             
  // else{
  //           // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
  //           //   return BlocProvider(
  //           //     create:(context)=>InboxScreenBloc(context),
  //           //     child:const InboxScreen(),
  //           //   );
  //           // }), (route) => false);
  //            }
        
        

      },
      child: Scaffold(body: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ListView(
                padding: const EdgeInsets.all(0),
                physics: const BouncingScrollPhysics(),
                //mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  CustomDivider(height: MediaQuery.of(context).size.height / 7),
                   const CustomDivider(height: 20),
                  const AppLogo(),
                  const CustomDivider(height: 40),
                  const ScreenHeading(heading: "Verify OTP"),
                  const CustomDivider(height: 40),
                  const _SignInForm(),
                  const CustomDivider(height: 10),
                  // const _ForgetPassword(),
                ],
              ),
            ),)));
  }
}