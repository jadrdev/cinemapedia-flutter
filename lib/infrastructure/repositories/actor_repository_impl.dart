import 'package:cinemapedia/domain/datasources/actors_datasources.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';
import 'package:cinemapedia/infrastructure/datasources/actor_moviedb_datasource.dart';

class ActorRepositoryImpl extends ActorsRepository {

  final ActorDataSource dataSource;
  ActorRepositoryImpl(this.dataSource);


  @override
  Future<List<Actor>> getActorByMovie(String movieId) {
    return dataSource.getActorByMovie(movieId);
  }
}
