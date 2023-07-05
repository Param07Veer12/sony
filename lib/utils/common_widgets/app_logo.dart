import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/images/appLogo.svg', width: 100,height: 50,);
  }
}
