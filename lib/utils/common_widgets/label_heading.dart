import 'package:flutter/material.dart';

class LabelHeading extends StatelessWidget {
  const LabelHeading({Key? key,required this.labelHeading}) : super(key: key);
  final String labelHeading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(labelHeading,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.grey
        ),),
    );
  }
}

class LabelOtp extends StatelessWidget {
  const LabelOtp({Key? key,required this.labelHeading}) : super(key: key);
  final String labelHeading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Center(
        child: Text(labelHeading,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
          ),
          textAlign: TextAlign.center,),
      ),
    );
  }
}

class LabelMain extends StatelessWidget {
  const LabelMain({Key? key,required this.labelHeading}) : super(key: key);
  final String labelHeading;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(labelHeading,
        style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
            
        ),
        textAlign: TextAlign.center,),
    );
  }
}

class LabelTermsAndCondition extends StatelessWidget {
  const LabelTermsAndCondition({Key? key,required this.labelHeading}) : super(key: key);
  final String labelHeading;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(labelHeading,
        style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.normal,
            color: Colors.blue,
            
        ),
        textAlign: TextAlign.center,),
    );
  }
}