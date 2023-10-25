import 'package:cinemapedia/infrastructure/datasources/series_moviedb_datasources.dart';
import 'package:cinemapedia/infrastructure/repositories/series_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Es repositorio es de SOLO LECTURA
final serieRepositoryProvider = Provider((ref) {
  return SerieRepositoryImpl(SerieMovieDbDataSource());
});
