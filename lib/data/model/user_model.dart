class UserModel {
  String? usersId;
  String? usersName;
  String? usersEmail;
  String? usersPassword;
  String? usersPhone;
  String? usersVerifyCode;
  String? usersApprove;
  String? usersCreate;

  UserModel(
      {this.usersId,
      this.usersName,
      this.usersEmail,
      this.usersPassword,
      this.usersPhone,
      this.usersVerifyCode,
      this.usersApprove,
      this.usersCreate});

  UserModel.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'];
    usersName = json['users_name'];
    usersEmail = json['users_email'];
    usersPassword = json['users_password'];
    usersPhone = json['users_phone'];
    usersVerifyCode = json['users_verifycode'];
    usersApprove = json['users_approve'];
    usersCreate = json['users_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['users_id'] = usersId;
    data['users_name'] = usersName;
    data['users_email'] = usersEmail;
    data['users_password'] = usersPassword;
    data['users_phone'] = usersPhone;
    data['users_verifycode'] = usersVerifyCode;
    data['users_approve'] = usersApprove;
    data['users_create'] = usersCreate;
    return data;
  }
}
