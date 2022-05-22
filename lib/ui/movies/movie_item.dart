import 'package:flutter/material.dart';

import '../../data/network/model/movie_dto.dart';
import '../../main.dart';

class MovieItem extends StatelessWidget {
  final MovieDto movie;

  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          DETAIL_PAGE,
          arguments: movie.imdbId,
        );
      },
      child: Card(
          elevation: 3,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(6),
                child: movie.poster == "N/A" ? const SizedBox(height: 120, width: 120) : Image.network(movie.poster ?? "", height: 120),
              ),
              Expanded(
                child: Column(
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
                ),
              )
            ],
          )),
    );
  }
}
