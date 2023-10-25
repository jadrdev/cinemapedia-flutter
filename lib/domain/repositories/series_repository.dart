import 'package:cinemapedia/domain/entities/serie.dart';

abstract class SeriesRepository {
  Future<List<Serie>> getAiringTodaySeries({int page = 1});
}
