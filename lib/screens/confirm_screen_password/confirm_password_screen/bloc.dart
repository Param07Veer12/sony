import 'package:bloc/bloc.dart';

import 'event.dart';
import 'state.dart';

class ConfirmPasswordScreenBloc extends Bloc<ConfirmPasswordScreenEvent, ConfirmPasswordScreenState> {
  ConfirmPasswordScreenBloc() : super(ConfirmPasswordScreenState()) {

  }

}
