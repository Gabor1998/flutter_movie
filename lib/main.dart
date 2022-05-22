import 'package:flutter/material.dart';
import 'package:flutter_movie/ui/movie/movie_page.dart';
import 'package:flutter_movie/ui/movies/movies_page.dart';

const DETAIL_PAGE = "/details";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MoviesPage(),
      onGenerateRoute: (settings) {
        final name = settings.name ?? "";
        if (name.startsWith(DETAIL_PAGE)) {
          return MaterialPageRoute(
            builder: (context) {
              return MoviePage(settings.arguments as String);
            },
          );
        }
        return null;
      },
    );
  }
}
