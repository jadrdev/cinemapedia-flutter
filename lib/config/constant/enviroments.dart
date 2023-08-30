import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroments {
  static String theMovieDBKEY =
      dotenv.env['THE_MOVIEDB_KEY'] ?? 'no hay api key';
}
