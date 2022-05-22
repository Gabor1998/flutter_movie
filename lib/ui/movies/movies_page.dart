import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/ui/movies/movies_bloc.dart';
import 'package:flutter_movie/ui/movies/movies_content.dart';

class MoviesPage extends StatefulWidget {
  @override
  MoviesPageState createState() => MoviesPageState();
}

class MoviesPageState extends State<MoviesPage> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
      ),
      body: BlocProvider(
        create: (_) => MoviesBloc(),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "Title",
                    ),
                    controller: _titleController,
                  ),
                ),
                BlocBuilder<MoviesBloc, MoviesState>(
                  builder: (context, state) {
                    return TextButton(
                        onPressed: () => {BlocProvider.of<MoviesBloc>(context).add(LoadMoviesEvent(_titleController.text))},
                        child: const Text("Search"));
                  },
                )
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 8)),
            Expanded(
              child: BlocBuilder<MoviesBloc, MoviesState>(
                builder: (context, state) {
                  if (state is MoviesLoadState) {
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
          ],
        ),
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
