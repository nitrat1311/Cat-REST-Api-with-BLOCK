import 'dart:convert';

import 'package:cat_api/models/cat_model.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

// const COLECTION = 'collection';

class LikesRepository {
  static const _delay = Duration(milliseconds: 800);

  List<Cat> _likes = [];

  Future<List<Cat>> loadLikesFromRepo() => Future.delayed(_delay, () => _likes);

  void addLikeToRepo(Cat like) => _likes.add(like);

  void removeLikeFromRepo(Cat like) => _likes.remove(like);
}

//   Stream<List<Cat>> fetchItems() async* {
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     if (_likes.isEmpty) {
//       yield _likes;
//     } else {
//       //   yield prefs.getStringList(COLECTION)?.map((e) {
//       //     final decodedImage = json.decode(e);
//       //     return Cat(
//       //       id: decodedImage['id'],
//       //       name: decodedImage['name'],
//       //       wikipediaUrl: decodedImage['wikipedia_url'],
//       //       origin: decodedImage['origin'],
//       //       image: CatImage.fromJson(decodedImage['image']),
//       //     );
//       //   }).toList();
//     }
//     yield _likes;
//   }

//   Future addLike(Cat like) async {
//     _likes.add(like);
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     if (_likes.isEmpty) {
//       return [];
//     }
//     // await prefs.setStringList(
//     //     COLECTION,
//     //     collection
//     //         .map(
//     //           (e) => json.encode({
//     //             "id": e.id,
//     //             "name": e.name,
//     //             "origin": e.origin,
//     //             "wikipedia_url": e.wikipediaUrl,
//     //             "image": e.image.toJson(),
//     //           }),
//     //         )
//     //         .toList());
//   }

//   Future<bool> likeExist(String id) async {
//     // SharedPreferences prefs = await SharedPreferences.getInstance();

//     if (_likes.map((like) => like.id).contains(id)) {
//       print('LikeExist');
//       return true;
//     }
//     return false;
//   }

//   Future dislike(Cat like) async {
//     await _likes.remove(like);
//     // SharedPreferences prefs = await SharedPreferences.getInstance();
//     // await prefs.setStringList(
//     //     COLECTION,
//     //     collection
//     //         .map(
//     //           (e) => json.encode({
//     //             "id": e.id,
//     //             "name": e.name,
//     //             "origin": e.origin,
//     //             "wikipedia_url": e.wikipediaUrl,
//     //             "image": e.image.toJson(),
//     //           }),
//     //         )
//     //         .toList());
//   }
// }
