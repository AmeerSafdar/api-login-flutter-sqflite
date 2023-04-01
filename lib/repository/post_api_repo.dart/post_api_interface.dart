import 'package:msincl/models/post_model_class.dart';

abstract class PostsAPI {
  Future<List<PostModelClass>> fetchData();
}
