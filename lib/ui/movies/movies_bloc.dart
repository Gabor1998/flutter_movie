import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie/data/network/model/movie_dto.dart';

import '../../repository/movie_repository.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final _movieRepository = MovieRepository();

  MoviesBloc() : super(const MoviesContentState([])) {
    on<LoadMoviesEvent>(
      (event, emit) async {
        try {
          emit(const MoviesLoadState());
          final searchDto = await _movieRepository.searchMovie(event.title);
          emit(MoviesContentState(searchDto.movies ?? []));
        } on Exception catch (e) {
          emit(MoviesErrorState(e.toString()));
        }
      },
    );
  }
}
