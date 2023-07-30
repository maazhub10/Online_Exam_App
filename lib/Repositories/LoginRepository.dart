import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:online_examination/models/User.dart';

class LoginRepository {
  Future<User> login(User user) async {
    var body = json.encode(user);
    final response = await http.post(
      Uri.parse("http://192.168.43.220:8080/api/userauth"),
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode==200) {
      return User.fromJson(json.decode(response.body));
    } else {
      print(response.statusCode);
      throw Exception("errror on login");
    }
  }

  dynamic findAll() {
    final respnse = http.get(Uri.parse("http://192.168.43.220:8080/api/users"));
    return respnse;
  }
}