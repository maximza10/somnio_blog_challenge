import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_challenge/blocs/post_event.dart';
import '../../blocs/post_bloc.dart';
import '../../repositories/post_repository.dart';
import '../widgets/post_list_view.dart';

class PostListPage extends StatelessWidget {
  final PostRepository postRepository;

  const PostListPage({super.key, required this.postRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => PostBloc(postRepository: postRepository)..add(LoadPosts()),
        child: const PostListView(),
      ),
    );
  }
}
