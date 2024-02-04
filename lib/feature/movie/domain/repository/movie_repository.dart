import 'package:movie_watch_list/core/resources/data_state.dart';
import 'package:movie_watch_list/core/resources/list_data.dart';
import 'package:movie_watch_list/feature/movie/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<DataState<ListData<MovieEntity>>> getMovieList({int page = 1});

  Future<DataState<MovieEntity>> getMovieDetails(int movieId);
}
