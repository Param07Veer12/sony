
part of 'term_conditions.dart';

class SubmitTermsWidget extends StatefulWidget {
  const SubmitTermsWidget({super.key});

  @override
  State<SubmitTermsWidget> createState() => _SubmitTermsWidgetState();
}

class _SubmitTermsWidgetState extends State<SubmitTermsWidget> {
  @override
  Widget build(BuildContext context) {
    return  Column(
        children:  [
         const SizedBox(height: 17),
        const  Padding(
            padding: EdgeInsets.only(left: 0,right: 0),
            child: SizedBox(height: 1,width: double.infinity,child: Material(color: Colors.grey,),)),
       const SizedBox(height: 10),
  
 Row(

              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                MyCheckbox(),
      const Flexible(
        child: Text(
          'I agree to Terms and Conditions to receive messages & notifications',
        ),
      ),           
       ],
            
           
      ),
           const SizedBox(height: 30),
  const _SubmitButton(),
       const SizedBox(height: 30),

        ],
      )
    ;
  }
}