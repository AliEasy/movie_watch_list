import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_watch_list/core/resources/list_data.dart';

abstract class MovieListState<T> extends Equatable {
  final ListData<T>? data;
  final DioException? error;

  const MovieListState({this.data, this.error});

  @override
  List<Object?> get props => [data, error];
}

class MovieListLoading<T> extends MovieListState<T> {
  const MovieListLoading();
}

class MovieListDone<T> extends MovieListState<T> {
  const MovieListDone(ListData<T> data) : super(data: data);
}

class MovieListLoadMore<T> extends MovieListState<T>{
  const MovieListLoadMore(ListData<T> data) : super(data: data);
}

class MovieListError<T> extends MovieListState<T> {
  const MovieListError(DioException error) : super(error: error);
}
