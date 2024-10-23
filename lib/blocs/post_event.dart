import 'package:equatable/equatable.dart';

// Definición de eventos para el PostBloc
abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

// Evento para cargar los posts
class LoadPosts extends PostEvent {}
