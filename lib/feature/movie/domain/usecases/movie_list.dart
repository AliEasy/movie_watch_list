import 'package:injectable/injectable.dart';
import 'package:movie_watch_list/core/resources/data_state.dart';
import 'package:movie_watch_list/core/resources/list_data.dart';
import 'package:movie_watch_list/core/usecase/usecase.dart';
import 'package:movie_watch_list/feature/movie/domain/entities/movie.dart';
import 'package:movie_watch_list/feature/movie/domain/repository/movie_repository.dart';

@injectable
class MovieListUseCase
    implements BaseUseCaseOptionalParam<DataState<ListData<MovieEntity>>, int> {
  final MovieRepository _movieRepository;

  MovieListUseCase(this._movieRepository);

  @override
  Future<DataState<ListData<MovieEntity>>> call({int params = 1}) {
    return _movieRepository.getMovieList(page: params);
  }
}
