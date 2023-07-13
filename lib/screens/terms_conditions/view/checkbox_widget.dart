part of 'term_conditions.dart';
class MyCheckbox extends StatefulWidget {
  @override
  _MyCheckboxState createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {

  @override
  Widget build(BuildContext context) {
    return  
    BlocBuilder<TermsAndConditionsBloc, TermsAndConditionsState>(
     //   buildWhen: (previous, current) => previous.notValidNumber!=current.notValidNumber,
        builder: (context, state) {
     

       return Checkbox(
         fillColor: MaterialStatePropertyAll(themeColor),
          value: state.isChecked,
          onChanged: (value) {
             context.read<TermsAndConditionsBloc>().onChangedValue(value ?? false);
              // isChecked = value;
          
          },
        );
        }
     )
    ;
  }
}