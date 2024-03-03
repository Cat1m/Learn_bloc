import 'package:couter_bloc/bloc/posts/posts_bloc.dart';
import 'package:couter_bloc/bloc/posts/posts_event.dart';
import 'package:couter_bloc/bloc/posts/posts_state.dart';
import 'package:couter_bloc/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post APIs'),
      ),
      body: BlocBuilder<PostBloc, PostStates>(builder: (context, state) {
        switch (state.postStatus) {
          case PostStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case PostStatus.failure:
            return Center(child: Text(state.message.toString()));
          case PostStatus.success:
            return ListView.builder(
              itemCount: state.postlist.length,
              itemBuilder: (context, index) {
                final item = state.postlist[index];
                return ListTile(
                  title: Column(
                    children: [
                      Text(item.postId.toString()),
                      Text(item.email.toString()),
                    ],
                  ),
                  subtitle: Text(item.body.toString()),
                );
              },
            );
        }
      }),
    );
  }
}
