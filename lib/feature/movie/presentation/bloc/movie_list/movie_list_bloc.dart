import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_watch_list/core/resources/data_state.dart';
import 'package:movie_watch_list/feature/movie/domain/usecases/movie_list.dart';
import 'package:movie_watch_list/feature/movie/presentation/bloc/movie_list/movie_list_event.dart';
import 'package:movie_watch_list/feature/movie/presentation/bloc/movie_list/movie_list_state.dart';

@injectable
class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final MovieListUseCase _movieListUseCase;

  MovieListBloc(this._movieListUseCase) : super(const MovieListLoading()) {
    on<GetMovieListEvent>(_onGetMovieList);
  }

  void _onGetMovieList(GetMovieListEvent event, Emitter<MovieListState> emit) async {
    emit(const MovieListLoading());
    final dataState = await _movieListUseCase.call(params: 1);
    if (dataState is DataSuccess) {
      emit(MovieListDone(dataState.data!));
    } else if (dataState is DataFailed) {
      emit(MovieListError(dataState.error!));
    }
  }
}
