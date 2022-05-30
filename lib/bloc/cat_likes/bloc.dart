import 'package:cat_api/repository/likes_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'event.dart';
import 'state.dart';

class LikeBloc extends Bloc<LikeEvent, LikesState> {
  LikeBloc({required this.likeRepository}) : super(LikesLoading()) {
    on<LikeStarted>(_loadLikes);
    on<AddLikeEvent>(_addLike);
    on<RemoveLikeEvent>(_removeLike);
  }
  final LikesRepository likeRepository;

  void _loadLikes(LikeStarted event, Emitter<LikesState> emit) async {
    try {
      final _loadedLikes = await likeRepository.loadLikesFromRepo();

      emit(LikesLoaded(likes: List.from(_loadedLikes)));
    } catch (_) {
      emit(LikesError());
    }
  }

  void _addLike(AddLikeEvent event, Emitter<LikesState> emit) {
    if (state is LikesLoaded)
      try {
        final state = this.state as LikesLoaded;
        likeRepository.addLikeToRepo(event.like);
        emit(LikesLoaded(likes: List.from(state.likes)..add(event.like)));
      } catch (_) {
        emit(LikesError());
      }
  }

  void _removeLike(RemoveLikeEvent event, Emitter<LikesState> emit) {
    if (state is LikesLoaded)
      try {
        final state = this.state as LikesLoaded;

        likeRepository.removeLikeFromRepo(event.like);
        emit(
          LikesLoaded(likes: List.from(state.likes)..remove(event.like)),
        );
      } catch (_) {
        emit(LikesError());
      }
  }
}
