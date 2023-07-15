class SideMenuListModel {
  final String mainHeading;
  final int id;
  final String icon;

   List<SubMenuModel> subMenu;

  SideMenuListModel({required this.mainHeading, required this.subMenu, required this.id, required this.icon});
}

class SubMenuModel{
   String subMenu;
   String code;
   String icon;
  SubMenuModel({required this.subMenu,required this.code, required this.icon});
}