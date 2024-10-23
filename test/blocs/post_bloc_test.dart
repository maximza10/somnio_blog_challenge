import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:blog_challenge/blocs/post_bloc.dart';
import 'package:blog_challenge/blocs/post_event.dart';
import 'package:blog_challenge/blocs/post_state.dart';
import 'package:blog_challenge/repositories/post_repository.dart';
import 'package:blog_challenge/models/post.dart';

import 'post_bloc_test.mocks.dart';

@GenerateMocks([PostRepository])
void main() {
  late MockPostRepository mockPostRepository;

  setUp(() {
    mockPostRepository = MockPostRepository();
  });

  final List<Post> mockPosts = [
    Post(userId: 1, id: 1, title: 'Test Post 1', body: 'Test Body 1'),
    Post(userId: 2, id: 2, title: 'Test Post 2', body: 'Test Body 2'),
  ];

  group('PostBloc', () {
    blocTest<PostBloc, PostState>(
      'emits [PostLoading, PostLoaded] when posts are loaded successfully',
      build: () {
        when(mockPostRepository.fetchPosts())
            .thenAnswer((_) async => mockPosts);
        return PostBloc(postRepository: mockPostRepository);
      },
      act: (bloc) => bloc.add(LoadPosts()),
      expect: () => [
        PostLoading(),
        PostLoaded(posts: mockPosts),
      ],
    );

    blocTest<PostBloc, PostState>(
      'emits [PostLoading, PostError] when fetching posts fails',
      build: () {
        when(mockPostRepository.fetchPosts())
            .thenThrow(Exception('Failed to fetch posts'));
        return PostBloc(postRepository: mockPostRepository);
      },
      act: (bloc) => bloc.add(LoadPosts()),
      expect: () => [
        PostLoading(),
        const PostError(message: 'Exception: Failed to fetch posts'),
      ],
    );
  });
}
