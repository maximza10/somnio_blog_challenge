import 'package:blog_challenge/ui/screens/post_list_page.dart';
import 'package:flutter/material.dart';

import '../../core/network/dio_client.dart';
import '../../repositories/post_repository.dart';
import '../../services/post_service.dart';

final dio = DioClient.createDio();

// Crea el servicio y repositorio para las publicaciones
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
          title: Text("Fixed TabBar Example"),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const ListTile(
                      title: Text('Title 1'),
                      subtitle: Text('Subtitle 1'),
                    ),
                  ],
                ),
              ),
              const SliverAppBar(
                pinned: true,
                floating: false,
                toolbarHeight: 0, // Para ocultar la barra de herramientas
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
              const Center(child: Text('Content of Tab 2')),
            ],
          ),
        ),
      ),
    );
  }
}
