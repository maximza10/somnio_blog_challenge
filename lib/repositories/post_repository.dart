import '../models/post.dart';
import '../services/post_service.dart';

class PostRepository {
  final PostService postService;

  PostRepository(this.postService);

  Future<List<Post>> fetchPosts() async {
    try {
      return await postService.getPosts();
    } catch (e) {
      rethrow;
    }
  }
}
