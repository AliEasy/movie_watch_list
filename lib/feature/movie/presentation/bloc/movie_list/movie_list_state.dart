import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_watch_list/feature/movie/domain/entities/list_data.dart';

abstract class MovieListState extends Equatable {
  final ListDataEntity? data;
  final DioException? error;

  const MovieListState({this.data, this.error});

  @override
  List<Object?> get props => [data, error];
}

class MovieListLoading extends MovieListState {
  const MovieListLoading();
}

class MovieListDone extends MovieListState {
  const MovieListDone(ListDataEntity data) : super(data: data);
}

class MovieListError extends MovieListState {
  const MovieListError(DioException error) : super(error: error);
}
