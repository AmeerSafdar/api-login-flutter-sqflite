// ignore_for_file: unnecessary_null_comparison

import 'package:msincl/helper/constants/common_keys.dart';
import 'package:msincl/helper/constants/const.dart';
import 'package:msincl/models/user_model.dart';
import 'package:msincl/repository/api/api.dart';
import 'package:msincl/repository/login_repo/login_api_interface.dart';
import 'package:dio/dio.dart';

class LoginRepoImplements extends LoginRepo {
  API _api = API();
  List<UsersModelClass> loggedInUser = [], _postsApi = [];
  Response? response;
  UsersModelClass? user;
  @override
  Future<List<UsersModelClass>?> login(String email, String password) async {
    loggedInUser = [];
    response = await _api.sendRequest.get(CommonKey.users_key);
    List<dynamic> posts = response!.data;
    _postsApi = posts.map((posts) => UsersModelClass.fromJson(posts)).toList();

    _postsApi.forEach((UsersModelClass p) =>
        p.email!.toString().contains(email) ? loggedInUser.add(p) : null);

    for (var element in loggedInUser) {
      db_helper.insert(UsersModelClass(
          id: element.id, email: element.email, username: element.username));
      USERD_ID = element.id.toString();
    }

    List<Map<String, Object?>>? user =
        await db_helper.getLogin(email, password);

    return user!.length > 0 ? loggedInUser : null;
  }

  @override
  Future<List<UsersModelClass>?> loggedinUserData(String id) async {
    loggedInUser = [];
    response = await _api.sendRequest.get(CommonKey.users_key);
    List<dynamic> posts = response!.data;
    _postsApi = posts.map((posts) => UsersModelClass.fromJson(posts)).toList();

    _postsApi.forEach((UsersModelClass p) =>
        p.id!.toInt() == int.parse(id) ? loggedInUser.add(p) : null);
    return loggedInUser;
  }

  @override
  void getUserID() async {
    userIDList = await db_helper.query();
    List<UsersModelClass> posts = userIDList
        .map((userIDList) => UsersModelClass.fromJson(userIDList))
        .toList();
    if (posts.length != 0) {
      for (var element in posts) {
        USERD_ID = element.id.toString();
      }
    }
  }
}
