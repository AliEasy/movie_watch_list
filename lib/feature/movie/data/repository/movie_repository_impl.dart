import 'dart:io';

import 'package:dio/dio.dart';
import 'package:movie_watch_list/core/resources/data_state.dart';
import 'package:movie_watch_list/feature/movie/data/data_sources/remote/movies_api_service.dart';
import 'package:movie_watch_list/feature/movie/data/models/list_data.dart';
import 'package:movie_watch_list/feature/movie/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MoviesApiService _moviesApiService;

  MovieRepositoryImpl(this._moviesApiService);

  @override
  Future<DataState<ListDataModel>> getMovies({int page = 1}) async {
    try {
      var httpsResponse = await _moviesApiService.getMovies(page: page);

      if (httpsResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpsResponse.data);
      } else {
        return DataFailed(DioException(
          error: httpsResponse.response.statusMessage,
          response: httpsResponse.response,
          requestOptions: httpsResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
