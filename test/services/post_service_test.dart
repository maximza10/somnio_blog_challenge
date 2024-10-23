import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:blog_challenge/services/post_service.dart';
import 'package:blog_challenge/models/post.dart';

import 'post_service_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late PostService postService;

  setUp(() {
    mockDio = MockDio();
    postService = PostService(mockDio);
  });

  final List<Post> mockPosts = [
    Post(userId: 1, id: 1, title: 'Test Post 1', body: 'Test Body 1'),
    Post(userId: 2, id: 2, title: 'Test Post 2', body: 'Test Body 2'),
  ];

  test('getPosts returns a list of posts when the API call is successful', () async {
    final response = Response(
      data: mockPosts.map((post) => post.toJson()).toList(),
      statusCode: 200,
      requestOptions: RequestOptions(path: ''),
    );

    when(mockDio.get(any, queryParameters: anyNamed('queryParameters')))
        .thenAnswer((_) async => response);

    final result = await postService.getPosts();

    expect(result.length, mockPosts.length);
  });

  test('getPosts throws an exception when the API call fails', () async {
    when(mockDio.get(any, queryParameters: anyNamed('queryParameters')))
        .thenThrow(DioException(
      requestOptions: RequestOptions(path: ''),
    ));

    expect(() => postService.getPosts(),
        throwsA(isA<DioException>()));
  });
}
