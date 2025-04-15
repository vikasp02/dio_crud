// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? accessToken;
  String? refreshToken;
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;

  LoginModel({
    this.accessToken,
    this.refreshToken,
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
    id: json["id"],
    username: json["username"],
    email: json["email"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    gender: json["gender"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "refreshToken": refreshToken,
    "id": id,
    "username": username,
    "email": email,
    "firstName": firstName,
    "lastName": lastName,
    "gender": gender,
    "image": image,
  };
}
// To parse this JSON data, do
//
//     final loginModelContact = loginModelContactFromJson(jsonString);

LoginModelContact loginModelContactFromJson(String str) =>
    LoginModelContact.fromJson(json.decode(str));

String loginModelContactToJson(LoginModelContact data) =>
    json.encode(data.toJson());

class LoginModelContact {
  String? id;
  String? name;
  String? email;
  String? token;

  LoginModelContact({this.id, this.name, this.email, this.token});

  factory LoginModelContact.fromJson(Map<String, dynamic> json) =>
      LoginModelContact(
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
