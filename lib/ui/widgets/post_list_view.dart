import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_challenge/blocs/post_state.dart';
import '../../blocs/post_bloc.dart';
import 'post_item_view.dart';

class PostListView extends StatelessWidget {
  const PostListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PostLoaded) {
          return ListView.builder(
            itemCount: state.posts.length,
            itemBuilder: (context, index) {
              final post = state.posts[index];
              return PostItemView(post);
            },
          );
        } else if (state is PostError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('No posts available.'));
        }
      },
    );
  }
}
