import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_watch_list/core/resources/data_state.dart';
import 'package:movie_watch_list/feature/movie/domain/usecases/get_movie.dart';
import 'package:movie_watch_list/feature/movie/presentation/bloc/movie/remote/remote_movie_event.dart';
import 'package:movie_watch_list/feature/movie/presentation/bloc/movie/remote/remote_movie_state.dart';

@injectable
class RemoteMovieBloc extends Bloc<RemoteMovieEvent, RemoteMovieState> {
  final GetMovieUseCase _getMovieUseCase;

  RemoteMovieBloc(this._getMovieUseCase) : super(const RemoteMovieLoading()) {
    on<GetMovie>(onGetMovie);
  }

  void onGetMovie(GetMovie event, Emitter<RemoteMovieState> emit) async {
    emit(const RemoteMovieLoading());
    final dataState = await _getMovieUseCase.call(params: 1);
    if (dataState is DataSuccess) {
      emit(RemoteMovieDone(dataState.data!));
    } else if (dataState is DataFailed) {
      emit(RemoteMovieError(dataState.error!));
    }
  }
}
