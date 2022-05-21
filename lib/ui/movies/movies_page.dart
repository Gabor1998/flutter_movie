import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/ui/movies/movies_bloc.dart';
import 'package:flutter_movie/ui/movies/movies_content.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
      ),
      body: BlocProvider(
        create: (_) => MoviesBloc(),
        child: Column(children: [
          TextFormField(
              initialValue: "Batman",
              decoration: const InputDecoration(
                labelText: 'Title',
              )),
          const Padding(padding: EdgeInsets.only(bottom: 8)),
          Expanded(
            child: BlocBuilder<MoviesBloc, MoviesState>(
              builder: (context, state) {
                if (state is MoviesLoadState) {
                  BlocProvider.of<MoviesBloc>(context).add(const LoadMoviesEvent("Batman"));
                  return const MovieListLoadingWidget();
                }

                if (state is MoviesContentState) {
                  return MovieListContent(state);
                }

                if (state is MoviesErrorState) {
                  return const Center(
                    child: Text("Something went wrong :("),
                  );
                }

                return const Center(
                  child: Text("Something went wrong :("),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}

class MovieListLoadingWidget extends StatelessWidget {
  const MovieListLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
