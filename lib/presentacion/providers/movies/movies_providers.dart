import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentacion/providers/movies/movies_respository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fecthMoreMovies = ref.watch(movieRepositoryProvider).getNowPlating;
  return MoviesNotifier(fectchMoreMovies: fecthMoreMovies);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  MovieCallback fectchMoreMovies;
  MoviesNotifier({
    required this.fectchMoreMovies,
  }) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;

    final List<Movie> movies = await fectchMoreMovies(page: currentPage);
    state = [...state, ...movies];
  }
}
