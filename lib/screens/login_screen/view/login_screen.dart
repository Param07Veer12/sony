

import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sony/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:sony/screens/home_screen/view/home_screen.dart';
import 'package:sony/screens/login_screen/bloc/login_screen_bloc.dart';
import 'package:sony/screens/otp_screen/bloc/otp_screen_bloc.dart';
import 'package:sony/utils/common_widgets/colors_used/colors_used.dart';

import '../../../utils/common_widgets/app_logo.dart';
import '../../../utils/common_widgets/custom_divider.dart';
import '../../../utils/common_widgets/label_heading.dart';
import '../../../utils/common_widgets/screen_heading.dart';
import '../../../utils/common_widgets/text_field_outline_border.dart';
import 'package:sony/utils/common_widgets/colors_used/colors_used.dart';

import '../../otp_screen/view/otp_screen.dart';
import '../../pop_up/view/pop_up_view.dart';
import 'dart:convert';
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

    final EncryptedSharedPreferences encryptedSharedPreferences =
      EncryptedSharedPreferences();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginScreenBloc, LoginScreenState>(
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
              encryptedSharedPreferences.setString('accessToken', state.logInDataModel?.accessToken ?? "");
              encryptedSharedPreferences.setString('refreshToken', state.logInDataModel?.refreshToken ?? "");
              encryptedSharedPreferences.setString('tokenType', state.logInDataModel?.tokenType ?? "");
              encryptedSharedPreferences.setString('isChangePasswordRequired', state.logInDataModel?.isChangePasswordRequired == true ? "true" : "false");


          encryptedSharedPreferences.getString('accessToken').then((String value) {
             print(value); 
             List<String> tokenArray = value.split('.');
             print(tokenArray); 

             String base64EncodedString = tokenArray[1];
List<int> res = base64.decode(base64.normalize(base64EncodedString));

String decodedString = utf8.decode(res);

Map<String, dynamic> decryptedMap = jsonDecode(decodedString);
print(decryptedMap);
             /// Prints Hello, World!
          });                // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
                //   return BlocProvider(
                //     create: (context)=>HomeScreenBloc(),
                //     child:const HomeScreen() ,
                //   );
                // }), (route) => false);


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
                  CustomDivider(height: MediaQuery.of(context).size.height / 5),
                  const ScreenHeading(heading: "Log In"),
                   const CustomDivider(height: 20),
                  const LabelMain(labelHeading: "By signing in you agreeing to our"),
                  const LabelTermsAndCondition(labelHeading: "Terms and privacy policy"),
                  const CustomDivider(height: 20),
                  const _SignInForm(),
                  const CustomDivider(height: 10),
                  // const _ForgetPassword(),
                ],
              ),
            ),));
  }
}