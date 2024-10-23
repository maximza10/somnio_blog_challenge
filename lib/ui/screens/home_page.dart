import 'package:blog_challenge/ui/screens/post_list_page.dart';
import 'package:flutter/material.dart';

import '../../core/network/dio_client.dart';
import '../../repositories/post_repository.dart';
import '../../services/post_service.dart';

final dio = DioClient.createDio();

final postService = PostService(dio);
final postRepository = PostRepository(postService);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Blog Posts"),
          backgroundColor: Colors.lightBlue,
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const ListTile(
                      title: Text('Blog'),
                      subtitle: Text('Example subtitule'),
                    ),
                  ],
                ),
              ),
              const SliverAppBar(
                pinned: true,
                floating: false,
                toolbarHeight: 0,
                backgroundColor: Colors.white,
                bottom: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.list)),
                    Tab(icon: Icon(Icons.list)),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              PostListPage(postRepository: postRepository),
              const Center(child: Text('Hello World!')),
            ],
          ),
        ),
      ),
    );
  }
}
