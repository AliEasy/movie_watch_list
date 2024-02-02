import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_watch_list/core/resources/data_state.dart';
import 'package:movie_watch_list/core/resources/list_data.dart';
import 'package:movie_watch_list/core/resources/list_metadata.dart';
import 'package:movie_watch_list/feature/movie/domain/entities/movie.dart';
import 'package:movie_watch_list/feature/movie/domain/usecases/movie_list.dart';
import 'package:movie_watch_list/feature/movie/presentation/bloc/movie_list/movie_list_event.dart';
import 'package:movie_watch_list/feature/movie/presentation/bloc/movie_list/movie_list_state.dart';

@injectable
class MovieListBloc extends Bloc<MovieListEvent, MovieListState<MovieEntity>> {
  final MovieListUseCase _movieListUseCase;
  List<MovieEntity> _movieList = [];
  ListMetadata _metaData = const ListMetadata.init();

  MovieListBloc(this._movieListUseCase) : super(const MovieListLoading()) {
    on<GetMovieListEvent>(_onGetMovieList);
    on<MovieListLoadMoreEvent>(_loadMoreMovie);
  }

  void _onGetMovieList(GetMovieListEvent event,
      Emitter<MovieListState<MovieEntity>> emit) async {
    emit(const MovieListLoading());
    final dataState = await _movieListUseCase.call(params: 1);
    if (dataState is DataSuccess) {
      _movieList = dataState.data!.data;
      _metaData = dataState.data!.metadata;
      var result = ListData(_movieList, _metaData);
      emit(MovieListDone(result));
    } else if (dataState is DataFailed) {
      emit(MovieListError(dataState.error!));
    }
  }

  void _loadMoreMovie(MovieListLoadMoreEvent event,
      Emitter<MovieListState<MovieEntity>> emit) async {
    var result = ListData(_movieList, _metaData);
    emit(MovieListLoadMore(result));
    final dataState = await _movieListUseCase.call(params: event.pageNumber);
    if (dataState is DataSuccess) {
      _movieList.addAll(dataState.data!.data);
      _metaData = dataState.data!.metadata;
      var result = ListData(_movieList, _metaData);
      emit(MovieListDone(result));
    } else if (dataState is DataFailed) {
      emit(MovieListError(dataState.error!));
    }
  }
}
