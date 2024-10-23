import 'package:equatable/equatable.dart';
import '../models/post.dart';

// Definición de estados para el PostBloc
abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

// Estado inicial
class PostInitial extends PostState {}

// Estado mientras los posts están siendo cargados
class PostLoading extends PostState {}

// Estado cuando los posts se han cargado correctamente
class PostLoaded extends PostState {
  final List<Post> posts;

  const PostLoaded({required this.posts});

  @override
  List<Object> get props => [posts];
}

// Estado en caso de error
class PostError extends PostState {
  final String message;

  const PostError({required this.message});

  @override
  List<Object> get props => [message];
}
