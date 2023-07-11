class LoginModel {
  int? status;
  bool? isChangePasswordRequired;
  String? accessToken;
  String? refreshToken;
  int? expireIn;
  String? tokenType;
  String? responseCode;
  String? responseMessage;

  LoginModel(
      {this.status,
      this.isChangePasswordRequired,
      this.accessToken,
      this.refreshToken,
      this.expireIn,
      this.tokenType,
      this.responseCode,
      this.responseMessage});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isChangePasswordRequired = json['isChangePasswordRequired'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    expireIn = json['expireIn'];
    tokenType = json['tokenType'];
    responseCode = json['responseCode'];
    responseMessage = json['responseMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['isChangePasswordRequired'] = this.isChangePasswordRequired;
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    data['expireIn'] = this.expireIn;
    data['tokenType'] = this.tokenType;
    data['responseCode'] = this.responseCode;
    data['responseMessage'] = this.responseMessage;
    return data;
  }
}
