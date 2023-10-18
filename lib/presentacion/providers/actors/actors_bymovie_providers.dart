import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentacion/providers/actors/actors_respository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorByMovieProviders = StateNotifierProvider<ActorByMovieNotifier, Map<String, List<Actor>>>(
  (ref) {
    final actorRepository = ref.watch(actorsRepositoryProvider);
    return ActorByMovieNotifier(getActors: actorRepository.getActorByMovie);
  }
);


typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);
class ActorByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {

  final GetActorsCallback getActors;

  ActorByMovieNotifier(
    {
      required this.getActors,
    }
  ) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;
    final List<Actor> actors = await getActors(movieId);
    state = {...state, movieId: actors};
  }
}
