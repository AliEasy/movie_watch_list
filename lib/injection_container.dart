import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_watch_list/feature/movie/data/data_sources/remote/movies_api_service.dart';
import 'package:movie_watch_list/feature/movie/data/repository/movie_repository_impl.dart';
import 'package:movie_watch_list/feature/movie/domain/repository/movie_repository.dart';
import 'package:movie_watch_list/feature/movie/domain/usecases/get_movie.dart';
import 'package:movie_watch_list/feature/movie/presentation/bloc/movie/remote/remote_movie_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<MoviesApiService>(MoviesApiService(sl()));
  sl.registerSingleton<MovieRepository>(
      MovieRepositoryImpl(sl())
  );
  sl.registerSingleton<GetMovieUseCase>(GetMovieUseCase(sl()));
  sl.registerFactory<RemoteMovieBloc>(() => RemoteMovieBloc(sl()));
}