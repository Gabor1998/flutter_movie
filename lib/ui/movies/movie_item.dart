import 'package:flutter/material.dart';

import '../../data/network/model/movie_dto.dart';

class MovieItem extends StatelessWidget {
  final MovieDto movie;

  const MovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(6),
              child: movie.poster == "N/A"
                  ? const SizedBox(height: 120, width: 120)
                  : Image.network(
                      movie.poster ?? "",
                      height: 120,
                    ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title ?? ""),
                const Padding(padding: EdgeInsets.all(2)),
                Text(movie.year ?? ""),
                const Padding(padding: EdgeInsets.all(2)),
                Text(movie.imdbId ?? ""),
                const Padding(padding: EdgeInsets.all(2)),
                Text(movie.type ?? "")
              ],
            )
          ],
        ));
  }
}
