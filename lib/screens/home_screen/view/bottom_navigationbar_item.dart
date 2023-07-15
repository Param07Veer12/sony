import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sony/screens/home_screen/model/menu_model.dart';

  List<BottomNavigationBarItem> buildNavigationItems(List<BottomMenus> menus) {
    return [
      for (var menu in menus)
        BottomNavigationBarItem(
          icon: SvgPicture.network(
            menu.icoPath,
            width: 32,
            height: 32,
          ),
          label: menu.menuTitle,
        ),
    ];
  }


  Widget buildTopMenus(List<TopMenus> topMenus,BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 60,
      width: screenWidth,
      
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: topMenus.length,
        separatorBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 10,bottom: 10),
            child: VerticalDivider(
              width: 1,
              thickness: 1,
              color: Colors.grey.shade300,
            ),
          );
        },
        itemBuilder: (context, index) {
          var menu = topMenus[index];
          return Padding(
            padding: EdgeInsets.all(0),
            child: GestureDetector(
              onTap: () {
                // Handle menu item tap
                // You can navigate to a different screen or perform any other action
              },
              child: SizedBox(
                width: screenWidth / 4,
                child: Column(
                
                  children:[
                    SizedBox(height: 10,),
                     SvgPicture.network(
                    menu.icoPath,
                    width: screenWidth / 4,
                    height: 30,
                  ),
                  Center(child: Text(menu.menuTitle,textAlign: TextAlign.center,style: TextStyle(fontSize: 8),))
                  ]
              
              
                ),
              ),
            ),
          );
        },
      ),
    );
  }
