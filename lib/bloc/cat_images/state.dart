part of 'bloc.dart';

abstract class CatsState extends Equatable {
  const CatsState();
  @override
  List<Object> get props => [];
}

class CatsLoadingState extends CatsState {
  @override
  List<Object> get props => [];
}

class CatsLoadedState extends CatsState {
  final List<Cat> catsImages;

  CatsLoadedState({required this.catsImages});

  @override
  List<Object> get props => [catsImages];
}

class NoInternetState extends CatsState {
  @override
  List<Object> get props => [];
}

class CatErrorState extends CatsState {
  @override
  List<Object> get props => [];
}
