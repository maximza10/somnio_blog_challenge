import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_event.dart';
import 'post_state.dart';
import '../repositories/post_repository.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc({required this.postRepository}) : super(PostInitial()) {

    on<PostEvent>(_onFetchPost);

  }

  _onFetchPost(PostEvent event, Emitter<PostState> emit) async {
    if (event is LoadPosts) {
      emit(PostLoading());
      try {
        final posts = await postRepository.fetchPosts();
        emit(PostLoaded(posts: posts));
      } catch (e) {
        emit(PostError(message: e.toString()));
      }
    }
  }
}
