part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();
}

class MoviesContentState extends MoviesState {
  final List<MovieDto> movies;

  const MoviesContentState(this.movies);

  @override
  List<Object> get props => [movies];
}

class MoviesLoadState extends MoviesState {
  const MoviesLoadState();

  @override
  List<Object> get props => [];
}

class MoviesErrorState extends MoviesState {
  final String message;

  const MoviesErrorState(this.message);

  @override
  List<Object> get props => [];
}
