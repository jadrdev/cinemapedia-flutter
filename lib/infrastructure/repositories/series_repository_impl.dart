import 'package:cinemapedia/domain/datasources/series_datasources.dart';
import 'package:cinemapedia/domain/entities/serie.dart';
import 'package:cinemapedia/domain/repositories/series_repository.dart';

class SerieRepositoryImpl extends SeriesRepository {
  final SeriesDataSource dataSource;

  SerieRepositoryImpl(this.dataSource);


  @override
  Future<List<Serie>> getAiringTodaySeries({int page = 1}) {
    return dataSource.getAiringTodaySeries(page: page);
  }
}
