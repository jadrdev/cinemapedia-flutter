import 'package:cinemapedia/presentacion/providers/providers.dart';
import 'package:cinemapedia/presentacion/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMovieProvider.notifier).loadNextPage();
    ref.read(topRatedMovieProvider.notifier).loadNextPage();
    ref.read(upComingMovieProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMovieProvider);
    final topRated = ref.watch(topRatedMovieProvider);
    final upComing = ref.watch(upComingMovieProvider);
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: CustomAppBar(),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(
              children: [
                // const
                MoviesSlideshow(movies: slideShowMovies),
                MovieHorizontalListView(
                  movies: nowPlayingMovies,
                  title: 'En Cines',
                  subtitle: 'Lunes 9',
                  loadNextPage: () {
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                  },
                ),
                MovieHorizontalListView(
                  movies: upComing,
                  title: 'Próximamente',
                  subtitle: 'Lunes 9',
                  loadNextPage: () {
                    ref.read(upComingMovieProvider.notifier).loadNextPage();
                  },
                ),
                MovieHorizontalListView(
                  movies: popularMovies,
                  title: 'Populares',
                  loadNextPage: () {
                    ref.read(popularMovieProvider.notifier).loadNextPage();
                  },
                ),
                MovieHorizontalListView(
                  movies: topRated,
                  title: 'Mejor Valoradas',
                  subtitle: 'Desde Siempre',
                  loadNextPage: () {
                    ref.read(topRatedMovieProvider.notifier).loadNextPage();
                  },
                ),
                const SizedBox(height: 10)
              ],
            );
          },
          childCount: 1,
        ))
      ],
    );
  }
}
