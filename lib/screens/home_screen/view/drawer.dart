 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sony/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:sony/utils/common_widgets/colors_used/colors_used.dart';

import '../model/side_menu_model.dart';

 
class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) { 
          
         return   Padding(
                    padding: EdgeInsets.only(top: 100.0),
    
        child: Drawer(
      backgroundColor: Colors.white,
    
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            //padding: EdgeInsets.only(top:20),
            margin: const EdgeInsets.only(top: 0),
            child: Column(children: <Widget>[
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset('assets/images/appLogo.svg'),
                ),
              ),
              const SizedBox(
                height: 5,
              ),

              
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text("Dummy"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "989898",
                      style: const TextStyle(fontSize: 14, color: themeColor),
                    ),
                  )),
            ]),
          ),
          
          Padding(
               
              padding: const EdgeInsets.only(left: 0),
              child: sideMenuListWidget(state.sideMenuModel ?? [])),
          
        ],
      ),
    )
         );
     });
  }
}

  Widget sideMenuListWidget(List <SideMenuListModel> sideMenuModel){
    return ListView.builder(
      padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics:const  NeverScrollableScrollPhysics(),
        itemCount: sideMenuModel.length,
        itemBuilder: (context,index){


          return  ExpansionTile(
            
            title: Text(sideMenuModel[index].mainHeading),
            // trailing : Icons.arrow_downward,
            leading : SvgPicture.network(
               sideMenuModel[index].icon
              
              ),
             backgroundColor: Colors.white,
             collapsedBackgroundColor: Colors.white,
             
            controlAffinity: ListTileControlAffinity.leading,
            children:sideMenuModel[index].subMenu.map((e) {
              return InkWell(
                  onTap: (){
                    print('value of inbox option-------->${e.code}');

                  },

                  child: ListTile(title: Text(e.subMenu),leading: SvgPicture.network(
               e.icon
              
              ),));
            }

            ).toList(),



          );
        }

    );
  }