

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sony/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:sony/screens/home_screen/view/home_screen.dart';
import 'package:sony/screens/welcome_screen/bloc/welcome_screen_bloc.dart';
import 'package:sony/utils/common_widgets/colors_used/colors_used.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}



   

class _WelcomeScreenState extends State<WelcomeScreen> {

   @override
  void initState() {
    super.initState();
    context.read<WelcomeScreenBloc>().add(NavigateToHomeScreenEvent());

  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<WelcomeScreenBloc, WelcomeScreenState>(
      listener: (context, state) {
          if (state is HomeScreenLoad) {
         
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
                  return BlocProvider(
                    create: (context)=>HomeScreenBloc(),
                    child:const HomeScreen() ,
                  );
                }), (route) => false);

                
                          }
        // TODO: implement listener
      },
      child:  Scaffold(body: 

      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome",style: TextStyle(color: themeColor,fontSize: 20)),
          SizedBox(height: 30,),
          Container(
            child: Material(
              child: Center(child:  SvgPicture.asset('assets/images/check.svg', width: 140,height: 130,alignment: Alignment.center),   
                
                   ),
            ),
                 
          ),
         Text("Login Successful!",style: TextStyle(color: themeColor,fontSize: 20)),

        ]
      ) ),
    );
  }
}