import 'package:cat_api/screens/all_cats_page.dart';
import 'package:cat_api/screens/favorites_page.dart';
import 'package:flutter/material.dart';

class HomeModel {
  final screens = [const AllCatsPage(), const FavoritesPage()];
  final appBarText = [const Text('Cats Breeds'), const Text('Favourites')];
  final bottomNavBars = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.pets_outlined),
      label: "All Cats",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: "Favorites",
    )
  ];
}
