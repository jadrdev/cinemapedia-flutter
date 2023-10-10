import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  static const name = 'movie-screen';
  final String movieid;
  const MovieScreen({super.key, required this.movieid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieID: $movieid'),
      ),
    );
  }
}
