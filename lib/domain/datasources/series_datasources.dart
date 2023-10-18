import 'package:cinemapedia/domain/entities/serie.dart';

abstract class SeriesDataSource{  
  Future<List<Serie>> airingToday();

}