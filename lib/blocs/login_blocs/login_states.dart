import 'package:msincl/enum/login_status.dart';
import 'package:msincl/models/user_model.dart';

class LoginStates {
  LoginStates(
      {this.loginStatus,
      this.data = const <UsersModelClass>[],
      this.hidePass = true});

  LoginStatus? loginStatus;
  List<UsersModelClass> data;
  bool hidePass = true;

  LoginStates copyWith(
      {LoginStatus? loginStatus, List<UsersModelClass>? data, bool? hidePass}) {
    return LoginStates(
        loginStatus: loginStatus ?? this.loginStatus,
        data: data ?? this.data,
        hidePass: hidePass ?? this.hidePass);
  }
}
