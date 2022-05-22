import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/network/model/movie_dto.dart';
import '../../repository/movie_repository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final _movieRepository = MovieRepository();

  MovieBloc() : super(const MovieLoadState()) {
    on<LoadMovieEvent>(
      (event, emit) async {
        try {
          final movie = await _movieRepository.getMovie(event.imdbId);
          emit(MovieContentState(movie));
        } on Exception catch (e) {
          emit(MovieErrorState(e.toString()));
        }
      },
    );
  }
}
