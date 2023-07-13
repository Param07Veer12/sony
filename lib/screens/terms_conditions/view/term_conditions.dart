

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sony/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:sony/screens/terms_conditions/bloc/terms_and_conditions_bloc.dart';
import 'package:sony/utils/common_widgets/colors_used/colors_used.dart';

import '../../home_screen/view/home_screen.dart';

part 'submit_terms_widget.dart';
part 'checkbox_widget.dart';
part 'submit_button.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({super.key});

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}
  const  termsCondition = '''Welcome to our website. If you continue to browse and use this website, you are agreeing to comply with and be bound by the following terms and conditions of use, which together with our privacy policy govern our relationship with you. If you disagree with any part of these terms and conditions, please do not use our website.

The term 'company' or 'us' or 'we' refers to the owner of the website. The term 'you' refers to the user or viewer of our website.

The use of this website is subject to the following terms:

1. The content of the pages of this website is for your general information and use only. It is subject to change without notice.

2. Neither we nor any third parties provide any warranty or guarantee as to the accuracy, timeliness, performance, completeness, or suitability of the information and materials found or offered on this website for any particular purpose. You acknowledge that such information and materials may contain inaccuracies or errors, and we expressly exclude liability for any such inaccuracies or errors to the fullest extent permitted by law.

3. Your use of any information or materials on this website is entirely at your own risk, for which we shall not be liable. It shall be your own responsibility to ensure that any products, services, or information available through this website meet your specific requirements.

4. This website contains material which is owned by or licensed to us. This material includes, but is not limited to, the design, layout, look, appearance, and graphics. Reproduction is prohibited other than in accordance with the copyright notice, which forms part of these terms and conditions.

5. All trademarks reproduced on this website, which are not the property of, or licensed to the operator, are acknowledged on the website.

6. Unauthorized use of this website may give rise to a claim for damages and/or be a criminal offense.

7. From time to time, this website may also include links to other websites. These links are provided for your convenience to provide further information. They do not signify that we endorse the website(s). We have no responsibility for the content of the linked website(s).

8. You may not create a link to this website from another website or document without our prior written consent.

9. Your use of this website and any dispute arising out of such use of the website is subject to the laws of the country in which we operate.

By using this website, you agree to these terms and conditions in full. If you disagree with these terms and conditions or any part of these terms and conditions, you must not use this website.

Thank you for reviewing our terms and conditions. If you have any questions or concerns, please contact us.''';


class _TermsAndConditionState extends State<TermsAndCondition> {
  @override
  Widget build(BuildContext context) {
    return  BlocListener<TermsAndConditionsBloc, TermsAndConditionsState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state.success == true)
        {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
                  return BlocProvider(
                    create: (context)=>HomeScreenBloc(),
                    child:const HomeScreen() ,
                  );
                }), (route) => false);

        }

      },
      child: Scaffold(
  appBar: AppBar(
    centerTitle: false,
    title: const Text('Terms and Condition Agreement?',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.left),
    
  ),
 body: const SingleChildScrollView(
          padding: EdgeInsets.only(left: 16.0,right: 16.0,top: 16.0,bottom: 16.0),
          child:  Column(children: 
          [Text(termsCondition), 
         SubmitTermsWidget()
          ]),
        ),
        
 
  

),
    );
  }
}