import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_watch_list/core/resources/data_state.dart';
import 'package:movie_watch_list/feature/movie/domain/usecases/movie_details.dart';
import 'package:movie_watch_list/feature/movie/presentation/bloc/movie_details/movie_details_event.dart';
import 'package:movie_watch_list/feature/movie/presentation/bloc/movie_details/movie_details_state.dart';

@injectable
class MovieDetailsBloc extends Bloc<GetMovieDetailsEvent, MovieDetailsState> {
  final MovieDetailsUseCase _useCase;

  MovieDetailsBloc(this._useCase) : super(const MovieDetailsLoading()) {
    on<GetMovieDetailsEvent>(_onGetMovieDetails);
  }

  void _onGetMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    emit(const MovieDetailsLoading());
    var dataState = await _useCase.call(event.movieId);
    if (dataState is DataSuccess) {
      emit(MovieDetailsDone(dataState.data!));
    } else if (dataState is DataFailed) {
      emit(MovieDetailsError(dataState.error!));
    }
  }
}
