part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
}

class LoadMovieEvent extends MovieEvent {
  final String imdbId;

  const LoadMovieEvent(this.imdbId);

  @override
  List<Object?> get props => [imdbId];
}
