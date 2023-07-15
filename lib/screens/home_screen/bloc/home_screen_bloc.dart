import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:sony/screens/home_screen/model/menu_model.dart';
import 'package:sony/utils/common_widgets/constants.dart';

import '../../../network/network_class.dart';
import '../../../network/network_response.dart';
import '../../../network/response_error.dart';
import '../../../network/web_urls.dart';
import '../model/side_menu_model.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState>  implements NetworkResponse{
  HomeScreenBloc({required BuildContext context}) : _context = context ,super(HomeScreenState()) {
    on<HomeScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
      final BuildContext _context;
        final EncryptedSharedPreferences encryptedSharedPreferences =
      EncryptedSharedPreferences();
  late MenusModel _menusModel;


 callGetMenus()

 async {
encryptedSharedPreferences.getString(ROLE_CODE).then((String roleCode)  async {
     Map<String, dynamic> map = {
  "UserRoleCode" :  roleCode,
    };

        await Future.delayed(const Duration(seconds: 1)); // This is to simulate that above checking process

    NetworkClass.fromNetworkClass(getGetMenus, this, reqGetMenus, map)
                  .callGetServiceWithToken(_context, true);

           });
  }

List <SideMenuListModel> getArray(List <RightMenus> rightMenu)
{
    List <SideMenuListModel> sideMenu = [];
    for (var i = 0; i < rightMenu.length; i++) {
      if (rightMenu[i].menuParentId == 0)
      {
      sideMenu.add(SideMenuListModel(mainHeading:rightMenu[i].menuTitle ?? "",subMenu: [],id: rightMenu[i].id ?? 0, icon: rightMenu[i].icoPath ?? ""));
      }
    // sideMenu.add(SideMenuListModel(mainHeading: ,subMenu: ))
}
    for (var i = 0; i < rightMenu.length; i++) {
       if (rightMenu[i].menuParentId != 0)
      {
            for (var j = 0; j < sideMenu.length; j++) {
  if (rightMenu[i].menuParentId == sideMenu[j].id)
  {
sideMenu[j].subMenu.add(SubMenuModel(subMenu: rightMenu[i].menuTitle ?? "", code: rightMenu[i].id.toString(), icon: rightMenu[i].icoPath ?? ""));
  }
            }
      }
    }
 print(sideMenu);
  return sideMenu;
}

   @override
  void onHTTPError({required int requestCode, required String response}) {
    try {
      throw const ResponseError();
    } on ResponseError catch (e) {
      emit(state.copyWith(success: false,isError : true, errorMessage: e.message));
    }
  }
  
  @override
  void onHTTPResponse({required int requestCode, required String response}) {
      switch (requestCode) {
        case reqGetMenus:
          _menusModel = MenusModel.fromJson(jsonDecode(response));
           switch (_menusModel.responseCode) {
            case "200":
              getArray(_menusModel.responseData?.rightMenus ?? []);
              print(getArray(_menusModel.responseData?.rightMenus ?? []));
              emit(state.copyWith(
                  menusModel: _menusModel,success : true,sideMenuModel: getArray(_menusModel.responseData?.rightMenus ?? [])));
              break;
            default:
              print("error in response-------->");
              emit(state.copyWith(
                  success: false,isError : true, errorMessage: _menusModel.responseMessage));
          }
       
      }
    
  }
  
  @override
  void onNoInternetAndServerError({required String message}) {
    emit(state.copyWith(success: false,isError: true, errorMessage: message));
  }

}
