import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:online_examination/models/Test.dart';

class TestRepository {
  Future<List<Test>> getAllTests() async {
    final response =
    await http.get(Uri.parse("http://192.168.43.220:8080/api/tests"));
    if (response.statusCode == 200) {
      return testsfromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  Future<List<Test>> getTestsByKeyword(String keyword) async {
    final response =
    await http.get(Uri.parse("http://192.168.43.220:8080/api/tests?keyword="+keyword));
    if (response.statusCode == 200) {
      return testsfromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }
}