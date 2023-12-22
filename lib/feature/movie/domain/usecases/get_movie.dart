import 'package:movie_watch_list/core/resources/data_state.dart';
import 'package:movie_watch_list/core/usecase/usecase.dart';
import 'package:movie_watch_list/feature/movie/domain/entities/list_data.dart';
import 'package:movie_watch_list/feature/movie/domain/repository/movie_repository.dart';

class GetMovieUseCase implements UseCase<DataState<ListDataEntity>, int> {
  final MovieRepository _movieRepository;

  GetMovieUseCase(this._movieRepository);

  @override
  Future<DataState<ListDataEntity>> call({int params = 1}) {
    return _movieRepository.getMovies(page: params);
  }
}
