import 'package:movie_watch_list/core/constants/constants.dart';
import 'package:movie_watch_list/feature/movie/data/models/list_data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'movies_api_service.g.dart';

@RestApi(baseUrl: moviesApiBaseURL)
abstract class MoviesApiService {
  factory MoviesApiService(Dio dio) = _MoviesApiService;

  @GET('/api/v1/movies')
  Future<HttpResponse<ListDataModel>> getMovies({
    @Query('page') int page = 1,
  });
}
