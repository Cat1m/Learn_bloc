// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:couter_bloc/model/posts_model.dart';
import 'package:couter_bloc/utils/enums.dart';

class PostStates extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postlist;
  final String message;

  const PostStates({
    this.postStatus = PostStatus.loading,
    this.postlist = const <PostModel>[],
    this.message = "",
  });

  @override
  List<Object?> get props => [postStatus, postStatus];

  PostStates copyWith({
    PostStatus? postStatus,
    List<PostModel>? postlist,
    String? message,
  }) {
    return PostStates(
      postStatus: postStatus ?? this.postStatus,
      postlist: postlist ?? this.postlist,
      message: message ?? this.message,
    );
  }
}
