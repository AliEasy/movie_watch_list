import 'package:injectable/injectable.dart';
import 'package:movie_watch_list/core/constants/constants.dart';
import 'package:movie_watch_list/feature/movie/data/models/list_data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_api_service.g.dart';

@injectable
@RestApi(baseUrl: moviesApiBaseURL)
abstract class MovieApiService {

  @factoryMethod
  factory MovieApiService(Dio dio) = _MovieApiService;

  @GET('/api/v1/movies')
  Future<HttpResponse<ListDataModel>> getMovieList({
    @Query('page') int page = 1,
  });
}
