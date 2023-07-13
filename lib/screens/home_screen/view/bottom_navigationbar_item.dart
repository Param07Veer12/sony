import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

 List<BottomNavigationBarItem> bottomNavigationItems = [
  BottomNavigationBarItem(
    icon: SvgPicture.asset('assets/images/homePic.svg'),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset('assets/images/installation.svg'),
    label: 'Installation',
  ),
  BottomNavigationBarItem(
    icon:  SvgPicture.asset(
      'assets/images/scheme.svg',
    ),
    label: 'Scheme',
  ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset('assets/images/support.svg'),
    label: 'Support',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.menu),
    label: 'Menu',
  ),
];
