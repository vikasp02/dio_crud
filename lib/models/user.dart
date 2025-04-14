// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? id;
  String? name;
  String? email;
  String? token;

  LoginModel({this.id, this.name, this.email, this.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "token": token,
  };
}
