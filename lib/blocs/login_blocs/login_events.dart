abstract class LoginEvents {}

class Login extends LoginEvents {
  String email, password;
  Login(this.email, this.password);
}

class Logout extends LoginEvents {}

class HideShowPassword extends LoginEvents {}

class UserLoggedIn extends LoginEvents {
  String id;
  UserLoggedIn(this.id);
}
