// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';


List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.id,
    this.fullname,
    this.username,
    this.email,
    this.password,
  });

  int? id;
  String? fullname;
  String? username;
  String? email;
  String? password;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    fullname: json["fullname"],
    username: json["username"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'username': username?.trim(),
      'password': password?.trim(),
      'email': email?.trim() ?? "",
      'fullname': fullname?.trim() ?? "",
      'id': id ,
    };
    return map;
  }
}