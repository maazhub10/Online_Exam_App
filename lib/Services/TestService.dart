import 'package:online_examination/Repositories/TestsRepository.dart';
import 'package:online_examination/models/Test.dart';

class TestsService {
  TestRepository testRepository = new TestRepository();

  Future<List<Test>> getAllTests() {
    Future<List<Test>> tests = testRepository.getAllTests();
    return tests;
  }

  Future<List<Test>> getTestsByKeyword(String keyword) async {
    List<Test> tests = await testRepository.getTestsByKeyword(keyword);
    return tests;
  }
}