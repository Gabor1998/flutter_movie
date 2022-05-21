import 'package:dio/dio.dart';
import 'package:flutter_movie/data/network/model/movie_search_dto.dart';
import 'package:retrofit/retrofit.dart';

import 'model/movie_dto.dart';

part 'movie_service.g.dart';

@RestApi(baseUrl: "http://www.omdbapi.com/")
abstract class MovieService {
  factory MovieService() {
    final dio = Dio();

    dio.interceptors.add(InterceptorsWrapper(onRequest: (request, handler) {
      request.queryParameters["apikey"] = "17cdc959";
      handler.next(request);
    }));
    dio.interceptors.add(LogInterceptor());
    return _MovieService(dio);
  }

  @GET("")
  Future<MovieSearchDto> searchMovie(@Query("s") String title);

  @GET("")
  Future<MovieDto> getMovie(@Query("i") String imdbId);
}
