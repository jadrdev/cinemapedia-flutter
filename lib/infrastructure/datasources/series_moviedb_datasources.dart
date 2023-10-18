import 'package:cinemapedia/config/constant/enviroments.dart';
import 'package:cinemapedia/domain/datasources/series_datasources.dart';
import 'package:cinemapedia/domain/entities/serie.dart';
import 'package:dio/dio.dart';

class SeriesMovieDBDataSource extends SeriesDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Enviroments.theMovieDBKEY,
      'language': 'es-ES',
    },
  ));
  
  @override
  Future<List<Serie>> airingToday() {
    return dio.get('/tv/airing_today').then((value) {
      final data = value.data;
      final results = data['results'];
      return List<Serie>.from(results.map((e) => Serie.fromJson(e)));
    });
  }
}
