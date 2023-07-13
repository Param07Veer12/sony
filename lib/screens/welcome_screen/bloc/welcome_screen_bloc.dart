import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'welcome_screen_event.dart';
part 'welcome_screen_state.dart';

class WelcomeScreenBloc extends Bloc<WelcomeScreenEvent, WelcomeScreenState> {
  WelcomeScreenBloc() : super(WelcomeScreenInitial()) {
    on<WelcomeScreenEvent>((event, emit) async {

    await Future.delayed(const Duration(seconds: 2)); // This is to simulate that above checking process

      emit(HomeScreenLoad());
      // TODO: implement event handler
    });
  }
}
