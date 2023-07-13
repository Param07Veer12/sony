import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part '../view/terms_and_conditions_event.dart';
part 'terms_and_conditions_state.dart';

class TermsAndConditionsBloc extends Bloc<TermsAndConditionsEvent, TermsAndConditionsState> {
  TermsAndConditionsBloc() : super(TermsAndConditionsState()) {
    on<TermsAndConditionsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  onChangedValue(bool value)
  {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state.copyWith(isChecked: value));
  }
   onSubmitValue()
  {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state.copyWith(success: true));
  }
}
