part of 'bloc.dart';

abstract class CatsEvent extends Equatable {}

class CheckInternet extends CatsEvent {
  List<Object> get props => [];
}

class HaveInternet extends CatsEvent {
  List<Object> get props => [];
}

class NoInternetEvent extends CatsEvent {
  List<Object> get props => [];
}
