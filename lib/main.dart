import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sony/app/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:sony/app/view/splash_screen.dart';
import 'package:sony/utils/common_widgets/colors_used/colors_used.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sony',
      theme: ThemeData(
       primarySwatch: customMaterialColor(themeColor),
        useMaterial3: true,
      ),
     
      home: BlocProvider(
            create: (_) => SplashScreenBloc(),
            child: const SplashScreen()),
    );
  }
}

