import 'package:injectable/injectable.dart';
import 'package:movie_watch_list/core/resources/data_state.dart';
import 'package:movie_watch_list/core/usecase/usecase.dart';
import 'package:movie_watch_list/feature/movie/domain/entities/movie.dart';
import 'package:movie_watch_list/feature/movie/domain/repository/movie_repository.dart';

@injectable
class MovieDetailsUseCase
    extends BaseUseCaseWithParam<DataState<MovieEntity>, int> {
  final MovieRepository _movieRepository;

  MovieDetailsUseCase(this._movieRepository);

  @override
  Future<DataState<MovieEntity>> call(int params) {
    return _movieRepository.getMovieDetails(params);
  }
}
