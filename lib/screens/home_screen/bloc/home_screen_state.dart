part of 'home_screen_bloc.dart';

class HomeScreenState {
     HomeScreenState({this.success = false, this.isError = false, this.errorMessage = "", this.menusModel,this.sideMenuModel
});

   bool success = false;
   final bool isError;
  final String? errorMessage;

  final MenusModel? menusModel;
   final   List <SideMenuListModel>? sideMenuModel;


  HomeScreenState copyWith({
    bool? success,
     bool? isError,
    String? errorMessage,
    MenusModel? menusModel,
    List <SideMenuListModel>? sideMenuModel

  }) {
    return HomeScreenState(
      success : success ?? this.success,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      menusModel:menusModel?? this.menusModel,
      sideMenuModel:sideMenuModel??this.sideMenuModel 
    );
  }

}

