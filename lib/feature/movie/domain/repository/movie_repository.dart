import 'package:movie_watch_list/core/resources/data_state.dart';
import 'package:movie_watch_list/feature/movie/domain/entities/list_data.dart';

abstract class MovieRepository {
  Future<DataState<ListDataEntity>> getMovieList({int page = 1});
}
