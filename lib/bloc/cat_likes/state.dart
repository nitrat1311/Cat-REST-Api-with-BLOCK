import 'package:cat_api/models/cat_model.dart';
import 'package:equatable/equatable.dart';

abstract class LikesState extends Equatable {
  const LikesState();
}

class LikesLoading extends LikesState {
  @override
  List<Object> get props => [];
}

class LikesLoaded extends LikesState {
  const LikesLoaded({this.likes = const <Cat>[]});

  final List<Cat> likes;

  @override
  List<Object> get props => [likes];
}

class LikesError extends LikesState {
  @override
  List<Object> get props => [];
}
