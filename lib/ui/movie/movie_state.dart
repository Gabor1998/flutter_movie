part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();
}

class MovieContentState extends MovieState {
  final MovieDto movie;

  const MovieContentState(this.movie);

  @override
  List<Object> get props => [movie];
}

class MovieLoadState extends MovieState {
  const MovieLoadState();

  @override
  List<Object> get props => [];
}

class MovieErrorState extends MovieState {
  final String message;

  const MovieErrorState(this.message);

  @override
  List<Object> get props => [];
}
