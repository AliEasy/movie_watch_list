import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_watch_list/feature/movie/domain/entities/movie.dart';

abstract class MovieDetailsState extends Equatable {
  final MovieEntity? movie;
  final DioException? error;

  const MovieDetailsState({this.movie, this.error});

  @override
  List<Object?> get props => [movie, error];
}

class MovieDetailsLoading extends MovieDetailsState {
  const MovieDetailsLoading();
}

class MovieDetailsDone extends MovieDetailsState {
  const MovieDetailsDone(MovieEntity movie) : super(movie: movie);
}

class MovieDetailsError extends MovieDetailsState {
  const MovieDetailsError(DioException error) : super(error: error);
}