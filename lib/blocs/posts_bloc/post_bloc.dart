import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msincl/blocs/posts_bloc/post_event.dart';
import 'package:msincl/blocs/posts_bloc/posts_states.dart';
import 'package:msincl/enum/post_status.dart';
import 'package:msincl/models/post_model_class.dart';
import 'package:msincl/repository/post_api_repo.dart/api_data_implemet.dart';

class PostsBloc extends Bloc<PostsEvents, PostStates> {
  final PostApiDataRepo _postRepository = PostApiDataRepo();
  List<PostModelClass>? data;
  PostsBloc() : super(PostStates()) {
    on<GetData>(_getApiData);
  }

  void _getApiData(GetData event, Emitter<PostStates> emit) async {
    try {
      emit(state.copyWith(status: PostStatus.loading));
      data = await _postRepository.fetchData();
      emit(state.copyWith(status: PostStatus.success, data: data));
    } catch (exc) {
      emit(state.copyWith(status: PostStatus.error));
    }
  }
}
