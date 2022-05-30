import 'package:cat_api/bloc/cat_likes/bloc.dart';
import 'package:cat_api/bloc/cat_likes/event.dart';
import 'package:cat_api/repository/likes_repository.dart';
import 'package:cat_api/rest_api/cat_api.dart';
import 'package:cat_api/screens/home_page.dart';

import 'package:cat_api/services/connectivity_service.dart';
import 'package:cat_api/theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc/cat_images/bloc.dart';
import 'bloc/cat_likes/bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CatsBloc>(
          create: (context) =>
              CatsBloc(ConnectivityService(), CatApi())..add(CheckInternet()),
        ),
        BlocProvider<LikeBloc>(
          create: (context) =>
              LikeBloc(likeRepository: LikesRepository())..add(LikeStarted()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        title: 'Cats App',
        home: Home(),
      ),
    );
  }
}
