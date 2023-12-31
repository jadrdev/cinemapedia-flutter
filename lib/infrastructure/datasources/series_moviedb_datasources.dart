import 'package:cinemapedia/config/constant/enviroments.dart';
import 'package:cinemapedia/domain/datasources/series_datasources.dart';
import 'package:cinemapedia/domain/entities/serie.dart';
import 'package:cinemapedia/infrastructure/mappers/serie_mappers.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/seriedb_response.dart';
import 'package:dio/dio.dart';

class SerieMovieDbDataSource extends SeriesDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroments.theMovieDBKEY,
        'language': 'es-ES',
      },
    ),
  );

  @override
  Future<List<Serie>> getAiringTodaySeries({int page = 1}) async {
    final response = await dio.get('/tv/airing_today');

    final seriedbResponse = SerieDbResponse.fromJson(response.data);

    final List<Serie> series = seriedbResponse.results
        .where((seriedb) => seriedb.posterPath != "no-poster")
        .map((seriedb) => SerieMapper.serieDBToEntity(seriedb))
        .toList();

    return series;
  }
}
