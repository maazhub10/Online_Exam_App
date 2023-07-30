import 'package:flutter/material.dart';
import 'package:online_examination/Services/TestService.dart';
import 'package:online_examination/models/Test.dart';

class QuizzProvider with ChangeNotifier {
  TestsService testsService = new TestsService();
  List<Test> tests = [];
  Test? selectedTest;

  QuizzProvider() {}

  getAllTests() async {
    print("get all tests");
    await testsService.getAllTests().then((data) => tests = data);
    print(tests);
    notifyListeners();
  }

  resetTests() {
    tests = [];
  }

  getTestsbykeyword(String keyword) async {
    await testsService.getTestsByKeyword(keyword).then((data) => tests = data);
    print("get tests by keyword");
    print(keyword);
    tests.forEach((element) => print(element.name));
    notifyListeners();
  }
}