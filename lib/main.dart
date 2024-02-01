import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_watch_list/config/theme/app_theme.dart';
import 'package:movie_watch_list/configureDependencies.dart';
import 'package:movie_watch_list/feature/movie/presentation/bloc/movie/remote/remote_movie_bloc.dart';
import 'package:movie_watch_list/feature/movie/presentation/bloc/movie/remote/remote_movie_event.dart';
import 'package:movie_watch_list/feature/movie/presentation/pages/home/movie_list.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteMovieBloc>(
      create: (context) => getIt<RemoteMovieBloc>()..add(const GetMovie()),
      child: MaterialApp(
        theme: theme(),
        debugShowCheckedModeBanner: false,
        home: const MovieListPage(),
      ),
    );
  }
}
