import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie/data/network/model/movie_dto.dart';

import '../../repository/movie_repository.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final _movieRepository = MovieRepository();

  MoviesBloc() : super(MoviesContentState([MovieDto("title", "year", "rated", "released", "runtime", "genre", "director", "writer", "actors", "plot", "language", "country", "awards", "https://m.media-amazon.com/images/M/MV5BMTYwNjAyODIyMF5BMl5BanBnXkFtZTYwNDMwMDk2._V1_SX300.jpg", List.empty(), "metascore", "imdbRating", "imdbVotes", "tt0111161", "type", "dvd", "boxOffice", "production", "website", "totalSeasons", "response")])) {
    on<LoadMoviesEvent>(
      (event, emit) async {
        try {
          final searchDto = await _movieRepository.searchMovie(event.title);
          emit(MoviesContentState(searchDto.movies ?? []));
        } on Exception catch (e) {
          emit(MoviesErrorState(e.toString()));
        }
      },
    );
  }
}
