import 'package:flutter/material.dart';
import 'package:flutter_movie/ui/movies/movies_page.dart';

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
        home: const MoviesPage());
  }
}
