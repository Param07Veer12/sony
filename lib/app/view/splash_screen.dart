
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sony/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:sony/screens/home_screen/view/home_screen.dart';
import 'package:sony/screens/login_screen/bloc/login_screen_bloc.dart';
import 'package:sony/screens/login_screen/view/login_screen.dart';
import '../splash_screen_bloc/splash_screen_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<SplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<SplashScreen> {
 final EncryptedSharedPreferences encryptedSharedPreferences =
      EncryptedSharedPreferences();
var alreadyLogin = false;

 @override
  void initState() {
    super.initState();
    context.read<SplashScreenBloc>().add(NavigateToHomeScreenEvent());

  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return BlocListener<SplashScreenBloc, SplashScreenState>(
         listener: (context, state) {
        if (state is Loaded) {
  encryptedSharedPreferences.getString('accessToken').then((String value) {
     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
                  return BlocProvider(
                    create: (context)=>HomeScreenBloc(context: context),
                    child:const HomeScreen() ,
                  );
                }), (route) => false);
  }); 
 
 Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
                  return BlocProvider(
                    create: (context)=>LoginScreenBloc(context: context),
                    child:const LoginScreen() ,
                  );
                }), (route) => false);
 
            //               }else{
            // // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
            // //   return BlocProvider(
            // //     create:(context)=>InboxScreenBloc(context),
            // //     child:const InboxScreen(),
            // //   );
            // // }), (route) => false);
            //  }
        }
        

      },
      child:  Scaffold(
      body:  Container(
          color: Colors.white,
          child: Center(child: SvgPicture.asset('assets/images/Start.svg', width: double.infinity,
  fit: BoxFit.cover)),
        ),
    ),
    );
    
    
    
    

  }
}
