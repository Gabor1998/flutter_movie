import 'package:flutter/material.dart';

import 'movie_item.dart';
import 'movies_bloc.dart';

class MovieListContent extends StatefulWidget {
  final MoviesContentState state;

  const MovieListContent(this.state);

  @override
  MovieListContentState createState() => MovieListContentState(state);
}

class MovieListContentState extends State<MovieListContent> {
  MoviesContentState state;

  MovieListContentState(this.state);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
        itemCount: state.movies.length,
        itemBuilder: (context, index) {
          final movie = state.movies[index];
          return MovieItem(key: Key(movie.imdbId ?? ""), movie: movie);
        });
  }
}
