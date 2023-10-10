import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentacion/providers/movies/movies_respository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fecthMoreMovies = ref.watch(movieRepositoryProvider).getNowPlating;
  return MoviesNotifier(fectchMoreMovies: fecthMoreMovies);
});

final popularMovieProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fecthMoreMovies = ref.watch(movieRepositoryProvider).getPopular;
  return MoviesNotifier(fectchMoreMovies: fecthMoreMovies);
});

final topRatedMovieProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fecthMoreMovies = ref.watch(movieRepositoryProvider).getTopRated;
  return MoviesNotifier(fectchMoreMovies: fecthMoreMovies);
});

final upComingMovieProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fecthMoreMovies = ref.watch(movieRepositoryProvider).getUpComing;
  return MoviesNotifier(fectchMoreMovies: fecthMoreMovies);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isloading = false;
  MovieCallback fectchMoreMovies;
  MoviesNotifier({
    required this.fectchMoreMovies,
  }) : super([]);

  Future<void> loadNextPage() async {
    if (isloading) return;
    isloading = true;
    currentPage++;

    final List<Movie> movies = await fectchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 500));
    isloading = false;
  }
}
