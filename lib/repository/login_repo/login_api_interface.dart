import 'package:msincl/models/user_model.dart';

abstract class LoginRepo {
  Future<List<UsersModelClass>?> login(String email, String password);
  void getUserID();
  Future<List<UsersModelClass>?> loggedinUserData(String id);
}
