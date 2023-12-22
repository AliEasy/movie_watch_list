import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_watch_list/feature/movie/domain/entities/list_data.dart';

abstract class RemoteMovieState extends Equatable {
  final ListDataEntity? data;
  final DioException? error;

  const RemoteMovieState({this.data, this.error});

  @override
  List<Object?> get props => [data, error];
}

class RemoteMovieLoading extends RemoteMovieState {
  const RemoteMovieLoading();
}

class RemoteMovieDone extends RemoteMovieState {
  const RemoteMovieDone(ListDataEntity data) : super(data: data);
}

class RemoteMovieError extends RemoteMovieState {
  const RemoteMovieError(DioException error) : super(error: error);
}
