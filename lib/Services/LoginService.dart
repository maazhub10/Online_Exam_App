import 'package:online_examination/Repositories/LoginRepository.dart';
import 'package:online_examination/models/User.dart';

class LoginService {
  LoginRepository loginRepository = new LoginRepository();
  Future<User> login(User user) {
    return loginRepository.login(user);
  }

  dynamic getAllUsers() {
    return loginRepository.findAll();
  }
}
