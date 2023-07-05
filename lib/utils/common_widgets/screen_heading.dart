import 'package:flutter/material.dart';
import 'package:sony/utils/common_widgets/colors_used/colors_used.dart';

class ScreenHeading extends StatelessWidget {
  const ScreenHeading({Key? key,required this.heading}) : super(key: key);
final String heading;
  @override
  Widget build(BuildContext context) {
    return  Container(child : FittedBox(
      fit: BoxFit.contain,
      child: Text(heading,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: themeColor,
        
      ),
      ),
    ),
      padding: EdgeInsets.only(
       bottom: 5,
       // Space between underline and text
     ),
    //  decoration: BoxDecoration( 
    //      border: Border(bottom: BorderSide(
    //      color: themeColor, 
    //      width: 2.0,
          
    //      // Underline thickness
    //     ))
    //   ),
      width: 35,
      height: 35,
      );
  }
}

