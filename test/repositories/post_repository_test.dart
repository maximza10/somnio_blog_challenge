import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:blog_challenge/repositories/post_repository.dart';
import 'package:blog_challenge/services/post_service.dart';
import 'package:blog_challenge/models/post.dart';

import 'post_repository_test.mocks.dart';

@GenerateMocks([PostService])
void main() {
  late MockPostService mockPostService;
  late PostRepository postRepository;

  setUp(() {
    mockPostService = MockPostService();
    postRepository = PostRepository(mockPostService);
  });

  final List<Post> mockPosts = [
    Post(userId: 1, id: 1, title: 'Test Post 1', body: 'Test Body 1'),
    Post(userId: 2, id: 2, title: 'Test Post 2', body: 'Test Body 2'),
  ];

  test('fetchPosts returns a list of posts when the service call is successful', () async {
    when(mockPostService.getPosts())
        .thenAnswer((_) async => mockPosts);

    final result = await postRepository.fetchPosts();

    expect(result, mockPosts);
    verify(mockPostService.getPosts()).called(1);
  });

  test('fetchPosts throws an exception when the service call fails', () async {
    when(mockPostService.getPosts())
        .thenThrow(Exception('Failed to load posts'));

    expect(() => postRepository.fetchPosts(),
        throwsA(isA<Exception>()));
  });
}
