
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sony/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:sony/utils/common_widgets/colors_used/colors_used.dart';

import 'bottom_navigationbar_item.dart';
import 'drawer.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
 
class _HomeScreenState extends State<HomeScreen> {

  void _openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

    void _onItemTapped(int index) {
    if (index == 4) {
      _scaffoldKey.currentState?.openEndDrawer();
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeScreenBloc, HomeScreenState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Scaffold(
        key: _scaffoldKey,
  appBar: AppBar(
    title: const Text(''),
     leading: IconButton(
          icon: SvgPicture.asset('assets/images/appLogo.svg',height: 60,),
          onPressed: () {
            // Handle menu button press
          },
        ),
         actions: [
          IconButton(
            icon: Icon(Icons.notifications_active,color: themeColor,),
            onPressed: () {
              // Handle button press
            },
          ),
        ],
  ),
  body:  Image.asset( "assets/images/homeImage.png",width: double.infinity,height: double.infinity,fit: BoxFit.fill),
  endDrawer: DrawerWidget(),
  
  bottomNavigationBar: BottomNavigationBar(
         type: BottomNavigationBarType.fixed, ///This allow more than 3 items
     backgroundColor: Colors.white,
     selectedItemColor: themeColor,
    currentIndex: _currentIndex,
     onTap: _onItemTapped,
    items: bottomNavigationItems,
  ),
),

    );

    

  }
}