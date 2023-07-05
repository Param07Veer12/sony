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