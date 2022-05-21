import 'package:flutter_movie/data/network/model/movie_search_dto.dart';
import 'package:flutter_movie/data/network/movie_service.dart';

import '../data/network/model/movie_dto.dart';

class MovieRepository {
  final movieService = MovieService();

  Future<MovieSearchDto> searchMovie(String title) async {
    return await movieService.searchMovie(title);
  }

  Future<MovieDto> getMovie(String imdbId) async {
    return await movieService.getMovie(imdbId);
  }
}
