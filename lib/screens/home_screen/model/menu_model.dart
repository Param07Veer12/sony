class MenusModel {
  ResponseData? responseData;
  String? responseCode;
  String? responseMessage;

  MenusModel({this.responseData, this.responseCode, this.responseMessage});

  MenusModel.fromJson(Map<String, dynamic> json) {
    responseData = json['responseData'] != null
        ? new ResponseData.fromJson(json['responseData'])
        : null;
    responseCode = json['responseCode'];
    responseMessage = json['responseMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.responseData != null) {
      data['responseData'] = this.responseData!.toJson();
    }
    data['responseCode'] = this.responseCode;
    data['responseMessage'] = this.responseMessage;
    return data;
  }
}

class ResponseData {
  List<RightMenus>? rightMenus;
  List<TopMenus>? topMenus;
  List<BottomMenus>? bottomMenus;
  List<Banners>? banners;

  ResponseData(
      {this.rightMenus, this.topMenus, this.bottomMenus, this.banners});

  ResponseData.fromJson(Map<String, dynamic> json) {
    if (json['rightMenus'] != null) {
      rightMenus = <RightMenus>[];
      json['rightMenus'].forEach((v) {
        rightMenus!.add(new RightMenus.fromJson(v));
      });
    }
    if (json['topMenus'] != null) {
      topMenus = <TopMenus>[];
      json['topMenus'].forEach((v) {
        topMenus!.add(new TopMenus.fromJson(v));
      });
    }
    if (json['bottomMenus'] != null) {
      bottomMenus = <BottomMenus>[];
      json['bottomMenus'].forEach((v) {
        bottomMenus!.add(new BottomMenus.fromJson(v));
      });
    }
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(new Banners.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rightMenus != null) {
      data['rightMenus'] = this.rightMenus!.map((v) => v.toJson()).toList();
    }
    if (this.topMenus != null) {
      data['topMenus'] = this.topMenus!.map((v) => v.toJson()).toList();
    }
    if (this.bottomMenus != null) {
      data['bottomMenus'] = this.bottomMenus!.map((v) => v.toJson()).toList();
    }
    if (this.banners != null) {
      data['banners'] = this.banners!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RightMenus {
  int? id;
  String? menuTitle;
  int? menuParentId;
  String? icoPath;
  String? destinationPath;
  int? orderNumber;

  RightMenus(
      {this.id,
      this.menuTitle,
      this.menuParentId,
      this.icoPath,
      this.destinationPath,
      this.orderNumber});

  RightMenus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    menuTitle = json['menuTitle'];
    menuParentId = json['menuParentId'];
    icoPath = json['icoPath'];
    destinationPath = json['destinationPath'];
    orderNumber = json['orderNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['menuTitle'] = this.menuTitle;
    data['menuParentId'] = this.menuParentId;
    data['icoPath'] = this.icoPath;
    data['destinationPath'] = this.destinationPath;
    data['orderNumber'] = this.orderNumber;
    return data;
  }
}
class MenuModel {
  MenuModel({
    required this.responseData,
    required this.responseCode,
    required this.responseMessage,
  });
  late final ResponseData responseData;
  late final String responseCode;
  late final String responseMessage;
  
  MenuModel.fromJson(Map<String, dynamic> json){
    responseData = ResponseData.fromJson(json['responseData']);
    responseCode = json['responseCode'];
    responseMessage = json['responseMessage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['responseData'] = responseData.toJson();
    _data['responseCode'] = responseCode;
    _data['responseMessage'] = responseMessage;
    return _data;
  }
}


class TopMenus {
  TopMenus({
    required this.id,
    required this.menuTitle,
    required this.menuParentId,
    required this.icoPath,
    required this.destinationPath,
    required this.orderNumber,
  });
  late final int id;
  late final String menuTitle;
  late final int menuParentId;
  late final String icoPath;
  late final String destinationPath;
  late final int orderNumber;
  
  TopMenus.fromJson(Map<String, dynamic> json){
    id = json['id'];
    menuTitle = json['menuTitle'];
    menuParentId = json['menuParentId'];
    icoPath = json['icoPath'];
    destinationPath = json['destinationPath'];
    orderNumber = json['orderNumber'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['menuTitle'] = menuTitle;
    _data['menuParentId'] = menuParentId;
    _data['icoPath'] = icoPath;
    _data['destinationPath'] = destinationPath;
    _data['orderNumber'] = orderNumber;
    return _data;
  }
}

class BottomMenus {
  BottomMenus({
    required this.id,
    required this.menuTitle,
    required this.menuParentId,
    required this.icoPath,
    required this.destinationPath,
    required this.orderNumber,
  });
  late final int id;
  late final String menuTitle;
  late final int menuParentId;
  late final String icoPath;
  late final String destinationPath;
  late final int orderNumber;
  
  BottomMenus.fromJson(Map<String, dynamic> json){
    id = json['id'];
    menuTitle = json['menuTitle'];
    menuParentId = json['menuParentId'];
    icoPath = json['icoPath'];
    destinationPath = json['destinationPath'];
    orderNumber = json['orderNumber'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['menuTitle'] = menuTitle;
    _data['menuParentId'] = menuParentId;
    _data['icoPath'] = icoPath;
    _data['destinationPath'] = destinationPath;
    _data['orderNumber'] = orderNumber;
    return _data;
  }
}

class Banners {
  Banners({
    required this.id,
    required this.menuTitle,
    required this.menuParentId,
    required this.icoPath,
    required this.destinationPath,
    required this.orderNumber,
  });
  late final int id;
  late final String menuTitle;
  late final int menuParentId;
  late final String icoPath;
  late final String destinationPath;
  late final int orderNumber;
  
  Banners.fromJson(Map<String, dynamic> json){
    id = json['id'];
    menuTitle = json['menuTitle'];
    menuParentId = json['menuParentId'];
    icoPath = json['icoPath'];
    destinationPath = json['destinationPath'];
    orderNumber = json['orderNumber'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['menuTitle'] = menuTitle;
    _data['menuParentId'] = menuParentId;
    _data['icoPath'] = icoPath;
    _data['destinationPath'] = destinationPath;
    _data['orderNumber'] = orderNumber;
    return _data;
  }
}