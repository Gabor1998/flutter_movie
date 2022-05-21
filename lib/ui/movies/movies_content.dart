import 'package:flutter/material.dart';

import 'movie_item.dart';
import 'movies_bloc.dart';

class MovieListContent extends StatefulWidget {
  final MoviesContentState state;

  const MovieListContent(this.state);

  @override
  _MovieListContentState createState() => _MovieListContentState(state);
}

class _MovieListContentState extends State<MovieListContent> {
  MoviesContentState state;

  _MovieListContentState(this.state);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
        itemCount: state.movies.length,
        itemBuilder: (context, index) {
          final movie = state.movies[index];
          return MovieItem(movie);
        });
  }
}
