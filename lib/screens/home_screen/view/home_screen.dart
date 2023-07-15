
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
  @override
  void initState() {
    
 context.read<HomeScreenBloc>().callGetMenus();
        // TODO: implement initSxtate
    super.initState();
  }
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
      child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) { 
          
         return   Scaffold(
        key: _scaffoldKey,
  appBar: AppBar(
    elevation: 3,
    title: const Text(''),
     leading: IconButton(
          icon: SvgPicture.asset('assets/images/appLogo.svg',height: 60,width: 100,),
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
  body: 
 state.success == true ?  Column(children: [
    buildTopMenus(state.menusModel?.responseData?.topMenus ?? [],context),
    
          Padding(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5,),
    Expanded(
      child: Padding(
        padding : EdgeInsets.only(left: 10,right: 10),
        child:
           Image.network(
                  state.menusModel?.responseData?.banners?[0].icoPath ?? "",
                  width: double.infinity,
                  fit: BoxFit.fill
                ),
        ),
    ),
    
          ],) : 
          SizedBox(),
  endDrawer: DrawerWidget(),
  
  bottomNavigationBar: 
 (state.menusModel?.responseData?.bottomMenus != null) ? BottomNavigationBar(
         type: BottomNavigationBarType.fixed, ///This allow more than 3 items
     backgroundColor: Colors.white,
     selectedItemColor: themeColor,
    currentIndex: _currentIndex,
     onTap: _onItemTapped,
    items: buildNavigationItems(state.menusModel?.responseData?.bottomMenus ?? []),
  ) : SizedBox()
) ;}),

    );

    

  }



 
}