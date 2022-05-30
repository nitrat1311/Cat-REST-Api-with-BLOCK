import 'package:cat_api/bloc/cat_images/bloc.dart';
import 'package:cat_api/models/cat_model.dart';
import 'package:cat_api/widgets/cached_image.dart';
import 'package:cat_api/widgets/cats_description.dart';
import 'package:cat_api/widgets/favorite_button.dart';
import 'package:cat_api/widgets/place_holder.dart';
import 'package:cat_api/widgets/wiki_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCatsPage extends StatelessWidget {
  const AllCatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatsBloc, CatsState>(
      builder: (context, state) {
        if (state is NoInternetState) {
          return Center(
            child: Text('Lost Connection'),
          );
        }
        if (state is CatErrorState) {
          return Center(
            child: Text('Error'),
          );
        }
        if (state is CatsLoadedState) {
          return ListOfAllCats(
            catsImages: state.catsImages,
          );
        } else {
          return Column(
            children: [
              const SizedBox(height: 100),
              CatsPlaceHolder(),
            ],
          );
        }
      },
    );
  }
}

class ListOfAllCats extends StatelessWidget {
  final List<Cat> catsImages;

  const ListOfAllCats({
    Key? key,
    required this.catsImages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: catsImages.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 20,
          child: ListTile(
            dense: true,
            title: CachedCatsImage(imageUrl: catsImages[index].image.url),
            subtitle: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CatsDescription(
                      catsName: catsImages[index].name,
                      catsOrigin: catsImages[index].origin,
                    ),
                    Row(
                      children: [
                        WikiLink(wikiUrl: catsImages[index].wikiUrl),
                        SizedBox(width: 20),
                        CatsFavoriteButton(
                          cat: catsImages[index],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
