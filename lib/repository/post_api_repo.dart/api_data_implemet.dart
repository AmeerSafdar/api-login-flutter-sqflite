import 'package:dio/dio.dart';
import 'package:msincl/helper/constants/common_keys.dart';
import 'package:msincl/models/post_model_class.dart';
import 'package:msincl/repository/api/api.dart';
import 'package:msincl/repository/post_api_repo.dart/post_api_interface.dart';

class PostApiDataRepo extends PostsAPI {
  API _api = API();

  @override
  Future<List<PostModelClass>> fetchData() async {
    Response response = await _api.sendRequest.get(CommonKey.posts_key);
    List<dynamic> posts = response.data;
    List<PostModelClass> _postsApi =
        posts.map((posts) => PostModelClass.fromJson(posts)).toList();

    return _postsApi;
  }
}
