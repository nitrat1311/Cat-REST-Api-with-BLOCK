import 'package:cat_api/bloc/cat_likes/bloc.dart';
import 'package:cat_api/bloc/cat_likes/event.dart';
import 'package:cat_api/bloc/cat_likes/state.dart';
import 'package:cat_api/models/cat_model.dart';
import 'package:cat_api/widgets/cached_image.dart';
import 'package:cat_api/widgets/cats_description.dart';
import 'package:cat_api/widgets/wiki_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikeBloc, LikesState>(
      builder: (context, state) {
        if (state is LikesLoading) {
          return Center(child: const CircularProgressIndicator());
        }
        if (state is LikesLoaded) {
          if (state.likes.isEmpty) {
            return Center(
              child: Text('Please add some Favorite Cats'),
            );
          } else {
            return ListOfFavorites(
              likes: state.likes,
            );
          }
        }
        return const Text('Something went wrong!');
      },
    );
  }
}

class ListOfFavorites extends StatelessWidget {
  final List<Cat> likes;
  const ListOfFavorites({Key? key, required this.likes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: likes.length,
      itemBuilder: (context, index) => Card(
        elevation: 20,
        child: ListTile(
          dense: true,
          title: CachedCatsImage(
            imageUrl: likes[index].image.url,
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CatsDescription(
                  catsName: likes[index].name, catsOrigin: likes[index].origin),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  WikiLink(wikiUrl: likes[index].wikiUrl),
                  IconButton(
                      onPressed: () => context
                          .read<LikeBloc>()
                          .add(RemoveLikeEvent(likes[index])),
                      icon: Icon(Icons.delete_forever),
                      iconSize: 30,
                      color: Colors.black)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
