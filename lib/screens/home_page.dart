import 'package:cat_api/models/home_models.dart';
import 'package:cat_api/screens/all_cats_page.dart';
import 'package:cat_api/screens/favorites_page.dart';
import 'package:flutter/material.dart';
import 'package:cat_api/theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: HomeModel().appBarText[_currentIndex],
          backgroundColor: theme.primaryColor,
        ),
        body: HomeModel().screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: true,
            selectedItemColor: theme.primaryColor,
            onTap: (index) => setState(() => _currentIndex = index),
            items: HomeModel().bottomNavBars));
  }
}
