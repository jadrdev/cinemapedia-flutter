import 'package:cinemapedia/domain/entities/serie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/serie_moviedb.dart';

class SerieMapper {
  static Serie serieDBToEntity(SerieMovieDb seriedb) => Serie(
      backdropPath: seriedb.backdropPath != ''
          ? "https://image.tmdb.org/t/p/w500${seriedb.backdropPath}"
          : "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/fb3ef66312333.5691dd2253378.jpg",
      firstAirDate: seriedb.firstAirDate,
      genreIds: seriedb.genreIds,
      id: seriedb.id,
      name: seriedb.name,
      originCountry: seriedb.originCountry,
      originalLanguage: seriedb.originalLanguage,
      originalName: seriedb.originalName,
      overview: seriedb.overview,
      popularity: seriedb.popularity,
      posterPath: seriedb.posterPath != ''
          ? "https://image.tmdb.org/t/p/w500${seriedb.posterPath}"
          : "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/fb3ef66312333.5691dd2253378.jpg",
      voteAverage: seriedb.voteAverage,
      voteCount: seriedb.voteCount);
}
