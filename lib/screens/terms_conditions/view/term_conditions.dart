

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





class _TermsAndConditionState extends State<TermsAndCondition> {

  @override
  void initState() {
    
 context.read<TermsAndConditionsBloc>().callGetTermsApi();
        // TODO: implement initSxtate
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocListener<TermsAndConditionsBloc, TermsAndConditionsState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state.success == true)
        {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
                  return BlocProvider(
                    create: (context)=>HomeScreenBloc(context: context),
                    child:const HomeScreen() ,
                  );
                }), (route) => false);

        }

      },
      child:BlocBuilder<TermsAndConditionsBloc, TermsAndConditionsState>(

        builder: (context, state) {
          return Scaffold(
  appBar: AppBar(
    centerTitle: false,
    title: const Text('Terms and Condition Agreement?',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.left),
    
  ),
 body:   SingleChildScrollView(
            padding: EdgeInsets.only(left: 16.0,right: 16.0,top: 16.0,bottom: 16.0),
            child:  Column(children: 
            [Text(state.termConditions ?? "Loading..."), 
           SubmitTermsWidget()
            ]),
          ),
 );
 }),
        
 
  


    );
  }
}