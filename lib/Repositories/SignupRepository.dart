import 'dart:convert';

import 'package:online_examination/models/User.dart';
import 'package:http/http.dart' as http;

class SignUpRepository {
  Future<User> Signup(User user) async {
    var body = json.encode(user);
    final response = await http.post(
      Uri.parse("http://192.168.43.220:8080/api/users"),
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      print(response.statusCode);
      throw Exception(response.body);
    }
  }
}