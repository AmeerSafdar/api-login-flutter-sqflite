import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msincl/blocs/login_blocs/login_events.dart';
import 'package:msincl/blocs/login_blocs/login_states.dart';
import 'package:msincl/enum/login_status.dart';
import 'package:msincl/helper/constants/const.dart';
import 'package:msincl/models/user_model.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  List<UsersModelClass>? data;
  LoginBloc() : super(LoginStates()) {
    on<Login>(_userLogin);
    on<UserLoggedIn>(_loggedIn);
    on<HideShowPassword>(_hideShowPass);
  }
  void _hideShowPass(HideShowPassword event, Emitter<LoginStates> emit) {
    emit(state.copyWith(hidePass: true));
  }

  void _loggedIn(UserLoggedIn event, Emitter<LoginStates> emit) async {
    try {
      emit(state.copyWith(loginStatus: LoginStatus.loading));
      data = await loginRepo.loggedinUserData(event.id);
      emit(state.copyWith(loginStatus: LoginStatus.success, data: data));
    } catch (e) {
      emit(state.copyWith(loginStatus: LoginStatus.error));
    }
  }

  void _userLogin(Login event, Emitter<LoginStates> emit) async {
    try {
      emit(state.copyWith(loginStatus: LoginStatus.loading));

      data = await loginRepo.login(event.email, event.password);

      emit(state.copyWith(
          loginStatus:
              data!.length > 0 ? LoginStatus.success : LoginStatus.loginError,
          data: data));
    } catch (exc) {
      print(exc);
      emit(state.copyWith(loginStatus: LoginStatus.error));
    }
  }
}
