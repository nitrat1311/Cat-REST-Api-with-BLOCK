import 'package:cat_api/models/cat_model.dart';
import 'package:equatable/equatable.dart';

abstract class LikeEvent extends Equatable {
  const LikeEvent();
}

class LikeStarted extends LikeEvent {
  @override
  List<Object> get props => [];
}

class AddLikeEvent extends LikeEvent {
  AddLikeEvent(
    this.like,
  );

  final Cat like;

  @override
  List<Object> get props => [like];
}

class RemoveLikeEvent extends LikeEvent {
  RemoveLikeEvent(this.like);

  final Cat like;

  @override
  List<Object> get props => [like];
}
