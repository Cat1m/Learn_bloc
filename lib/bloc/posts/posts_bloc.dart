import 'package:bloc/bloc.dart';
import 'package:couter_bloc/bloc/posts/posts_event.dart';
import 'package:couter_bloc/bloc/posts/posts_state.dart';
import 'package:couter_bloc/repository/post_repository.dart';
import 'package:couter_bloc/utils/enums.dart';

class PostBloc extends Bloc<PostsEvent, PostStates> {
  PostRepository postRepository = PostRepository();
  PostBloc() : super(const PostStates()) {
    on<PostFetched>(fetchPostApi);
  }

  void fetchPostApi(PostFetched event, Emitter<PostStates> emit) async {
    await postRepository.fetchPost().then((value) {
      emit(
        state.copyWith(
            postStatus: PostStatus.success,
            message: "success",
            postlist: value),
      );
      print(value);
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          postStatus: PostStatus.failure, message: error.toString()));
    });
  }
}
