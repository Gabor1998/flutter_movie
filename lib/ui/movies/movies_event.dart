part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
}

class LoadMoviesEvent extends MoviesEvent{
  final String title;

  const LoadMoviesEvent(this.title);

  @override
  List<Object?> get props => [title];
}
