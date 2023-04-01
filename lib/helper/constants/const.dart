// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:msincl/repository/login_repo/db_helper/db_services.dart';
import 'package:msincl/repository/login_repo/login_repo_implement.dart';

const String API_URL = 'https://jsonplaceholder.typicode.com/';
String? USERD_ID;
final dio = Dio();
List<Map<String, dynamic>> userIDList = [];
DB_Helper db_helper = DB_Helper();
final loginRepo = LoginRepoImplements();
