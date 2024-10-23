import 'package:dio/dio.dart';
import '../models/post.dart';

class PostService {
  final Dio _dio;

  PostService(this._dio);

  Future<List<Post>> getPosts() async {
    final response = await _dio.get('https://jsonplaceholder.typicode.com/posts');
    List<Post> posts = (response.data as List).map((post) => Post.fromJson(post)).toList();
    return posts;
  }
}
