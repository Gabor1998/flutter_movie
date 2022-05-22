import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movie_bloc.dart';

class MoviePage extends StatelessWidget {
  final String imdbId;

  const MoviePage(this.imdbId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Movie"),
          ),
          body: BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              if (state is MovieLoadState) {
                BlocProvider.of<MovieBloc>(context).add(LoadMovieEvent(imdbId));
                return const MovieLoadingWidget();
              }

              if (state is MovieContentState) {
                final movie = state.movie;
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          movie.poster == "N/A" ? const SizedBox(width: 250) : Image.network(movie.poster ?? "", height: 250),
                          const Padding(padding: EdgeInsets.all(4)),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(padding: EdgeInsets.all(8)),
                                Text(movie.title ?? "", style: const TextStyle(fontSize: 18)),
                                const Padding(padding: EdgeInsets.all(4)),
                                Text(movie.year ?? "", style: const TextStyle(fontSize: 18)),
                                const Padding(padding: EdgeInsets.all(4)),
                                Text(movie.genre ?? ""),
                                const Padding(padding: EdgeInsets.all(4)),
                                Text(movie.runtime ?? ""),
                                const Padding(padding: EdgeInsets.all(4)),
                                Text(movie.imdbId ?? ""),
                                const Padding(padding: EdgeInsets.all(4)),
                                Text(movie.type ?? "")
                              ],
                            ),
                          )
                        ],
                      ),
                      const Padding(padding: EdgeInsets.all(8)),
                      Text(movie.plot ?? "")
                    ],
                  ),
                );
              }

              if (state is MovieErrorState) {
                return const Center(
                  child: Text("Something went wrong :("),
                );
              }

              return const Center(
                child: Text("Something went wrong :("),
              );
            },
          )),
    );
  }
}

class MovieLoadingWidget extends StatelessWidget {
  const MovieLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
