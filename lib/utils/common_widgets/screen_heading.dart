import 'package:flutter/material.dart';
import 'package:sony/utils/common_widgets/colors_used/colors_used.dart';

class ScreenHeading extends StatelessWidget {
  const ScreenHeading({Key? key,required this.heading}) : super(key: key);
final String heading;
  @override
  Widget build(BuildContext context) {
    return  Column(children : [FittedBox(
      fit: BoxFit.contain,
      child: Text(heading,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: themeColor,
        // decoration: TextDecoration.underline,
        decorationThickness: 1.0, // Adjust the value to increase/decrease the space

      ),
      ),
    ),
     SizedBox(height: 4
     ,),
      SizedBox(height: 2,width: 80,child: Material(color:themeColor),)
     ]
      
    //  decoration: BoxDecoration( 
    //      border: Border(bottom: BorderSide(
    //      color: themeColor, 
    //      width: 2.0,
          
    //      // Underline thickness
    //     ))
    //   ),
      );
  }
}

