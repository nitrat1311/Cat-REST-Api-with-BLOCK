import 'package:cat_api/bloc/cat_likes/bloc.dart';
import 'package:cat_api/bloc/cat_likes/event.dart';
import 'package:cat_api/bloc/cat_likes/state.dart';
import 'package:cat_api/models/cat_model.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatsFavoriteButton extends StatelessWidget {
  final Cat cat;
  const CatsFavoriteButton({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikeBloc, LikesState>(
      builder: (context, likeState) {
        if (likeState is LikesLoaded) {
          bool res = likeState.likes.contains(cat);
          return FavoriteButton(
            valueChanged: (isLiked) {
              if (res) {
                context.read<LikeBloc>().add(RemoveLikeEvent(cat));
              } else {
                context.read<LikeBloc>().add(AddLikeEvent(cat));
              }
            },
            isFavorite: res,
            iconSize: 60,
            iconDisabledColor: Colors.grey,
          );
        }
        return Center(child: const CircularProgressIndicator());
      },
    );
  }
}
