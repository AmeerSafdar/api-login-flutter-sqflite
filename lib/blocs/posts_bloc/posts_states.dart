import 'package:msincl/enum/post_status.dart';
import 'package:msincl/models/post_model_class.dart';

class PostStates {
  PostStates({
    this.status = PostStatus.initial,
    this.data = const <PostModelClass>[],
  });

  PostStatus? status;
  List<PostModelClass> data;

  PostStates copyWith({
    PostStatus? status,
    List<PostModelClass>? data,
  }) {
    return PostStates(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }
}
