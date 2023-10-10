import 'package:cinemapedia/domain/datasources/movies_datasources.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository{

  final MoviesDataSource dataSource;
  MovieRepositoryImpl(this.dataSource);

  @override
  Future<List<Movie>> getNowPlating({int page = 1}) {
    return dataSource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return dataSource.getPopular(page: page);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return dataSource.getTopRated(page: page);
  }
  
  @override
  Future<List<Movie>> getUpComing({int page = 1}) {
    return dataSource.getUpComing(page: page);
  }
  
  @override
  Future<Movie> getMovieById(int id) {
    return dataSource.getMovieById(id);
  }

  

}