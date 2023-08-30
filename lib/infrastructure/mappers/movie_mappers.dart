import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
        adult: moviedb.adult,
        id: moviedb.id,
        title: moviedb.title,
        overview: moviedb.overview,
        posterPath: (moviedb.posterPath != '')
            ? 'https://image.tmdb.org/t/p/w500/${moviedb.posterPath}'
            : 'no-poster',
        backdropPath: (moviedb.backdropPath != '')
            ? 'https://image.tmdb.org/t/p/w500/${moviedb.backdropPath}'
            : 'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/fb3ef66312333.5691dd2253378.jpg',
        releaseDate: moviedb.releaseDate,
        voteAverage: moviedb.voteAverage,
        genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
        originalLanguage: moviedb.originalLanguage,
        originalTitle: moviedb.originalTitle,
        popularity: moviedb.popularity,
        video: moviedb.video,
        voteCount: moviedb.voteCount,
      );
}
