class LoginModel {
  int? id;
  String? userName;
  String? roleCode;
  String? branchCode;
  String? fullName;
  String? emailId;
  String? mobileNo;
  int? status;
  String? statusName;
  bool? isChangePasswordRequired;
  bool? isTermsCondition;
  bool? isOtpRequired;
  String? otpReferanceId;
  bool? isLocationRequired;
  int? locationReferanceId;
  String? accessToken;
  String? refreshToken;
  int? expireIn;
  String? tokenType;
  String? responseCode;
  String? responseMessage;

  LoginModel(
      {this.id,
      this.userName,
      this.roleCode,
      this.branchCode,
      this.fullName,
      this.emailId,
      this.mobileNo,
      this.status,
      this.statusName,
      this.isChangePasswordRequired,
      this.isTermsCondition,
      this.isOtpRequired,
      this.otpReferanceId,
      this.isLocationRequired,
      this.locationReferanceId,
      this.accessToken,
      this.refreshToken,
      this.expireIn,
      this.tokenType,
      this.responseCode,
      this.responseMessage});

  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    roleCode = json['roleCode'];
    branchCode = json['branchCode'];
    fullName = json['fullName'];
    emailId = json['emailId'];
    mobileNo = json['mobileNo'];
    status = json['status'];
    statusName = json['statusName'];
    isChangePasswordRequired = json['isChangePasswordRequired'];
    isTermsCondition = json['isTermsCondition'];
    isOtpRequired = json['isOtpRequired'];
    otpReferanceId = json['otpReferanceId'];
    isLocationRequired = json['isLocationRequired'];
    locationReferanceId = json['locationReferanceId'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    expireIn = json['expireIn'];
    tokenType = json['tokenType'];
    responseCode = json['responseCode'];
    responseMessage = json['responseMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['roleCode'] = this.roleCode;
    data['branchCode'] = this.branchCode;
    data['fullName'] = this.fullName;
    data['emailId'] = this.emailId;
    data['mobileNo'] = this.mobileNo;
    data['status'] = this.status;
    data['statusName'] = this.statusName;
    data['isChangePasswordRequired'] = this.isChangePasswordRequired;
    data['isTermsCondition'] = this.isTermsCondition;
    data['isOtpRequired'] = this.isOtpRequired;
    data['otpReferanceId'] = this.otpReferanceId;
    data['isLocationRequired'] = this.isLocationRequired;
    data['locationReferanceId'] = this.locationReferanceId;
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    data['expireIn'] = this.expireIn;
    data['tokenType'] = this.tokenType;
    data['responseCode'] = this.responseCode;
    data['responseMessage'] = this.responseMessage;
    return data;
  }
}
