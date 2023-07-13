import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
     

  SplashScreenBloc() : super(Initial()) {
    on<SplashScreenEvent>((event, emit) async {
      // TODO: implement event handler
        
    await Future.delayed(const Duration(seconds: 2)); // This is to simulate that above checking process

     // await Future.delayed(const Duration(seconds: 3)); // This is to simulate that above checking process
    emit( Loaded());
 


    });
  }
}
