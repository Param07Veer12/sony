import 'package:bloc/bloc.dart';

import 'event.dart';
import 'state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(ChangePasswordState()) {

  }


}
