import 'package:online_examination/Repositories/SignupRepository.dart';
import 'package:online_examination/models/User.dart';

class SignUpService {
  SignUpRepository signUpRepository = new SignUpRepository();

  Future<User> SignUp(User user) {
    return signUpRepository.Signup(user);
  }
}