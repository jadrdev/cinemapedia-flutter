import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentacion/providers/movies/movie_info_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const name = 'movie-screen';
  final String movieid;
  const MovieScreen({super.key, required this.movieid});

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieid);
  }

  @override
  Widget build(BuildContext context) {
    final Movie? movie = ref.watch(movieInfoProvider)[widget.movieid];

    if (movie == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
      );
    }
    return Scaffold(
        body: CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        _CustomSliverAppBar(movie: movie),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) => _MovieDetails(movie: movie),
          childCount: 1,
        ))
      ],
    ));
  }
}

class _MovieDetails extends StatelessWidget {
  final Movie movie;

  const _MovieDetails({required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image(
                    image: NetworkImage(movie.posterPath),
                    width: size.width * 0.3,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: (size.width - 40) * 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sinopsis',
                        style: textStyles.titleLarge,
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        movie.overview,
                        style: textStyles.bodySmall,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ],
            )),

        //Generos de la película
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Generos',
                style: textStyles.titleMedium,
              ),
              Wrap(
                children: [
                  ...movie.genreIds.map((gender) => Container(
                        margin: const EdgeInsets.all(5),
                        child: Chip(
                          label: Text(gender),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),

        // TODO: Mostrar actores ListView
        const SizedBox(
          height: 100,
        ),
      ],
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomSliverAppBar({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    ReCase movieTitle = ReCase(movie.title);

    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.height * 0.02),
        title: Text(movieTitle.titleCase,
            style: const TextStyle(fontSize: 20), textAlign: TextAlign.start),
        background: Stack(children: [
          SizedBox.expand(
            child: Image.network(movie.posterPath, fit: BoxFit.cover),
          ),
          SizedBox.expand(
            child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
              Colors.black.withOpacity(0.5),
              Colors.transparent
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter))),
          ),
          const SizedBox.expand(
            child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
              Colors.black87,
              Colors.transparent,
            ], stops: [
              0.0,
              0.4
            ], begin: Alignment.topLeft))),
          )
        ]),
      ),
    );
  }
}
