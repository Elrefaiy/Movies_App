import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../domain/entities/movies_list.dart';
import '../cubit/movies_lists_cubit.dart';
import 'movie.dart';

class MoviesList extends StatelessWidget {
  final double top;
  final double left;
  final int currentIndex;
  const MoviesList({
    super.key,
    required this.top,
    required this.left,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    int length = 0;
    List<Result> movies = [];
    switch (currentIndex) {
      case 0:
        movies = MoviesListsCubit.get(context).nowPlayingMovies;
        length = MoviesListsCubit.get(context).nowPlayingMovies.length;
        break;
      case 1:
        movies = MoviesListsCubit.get(context).popularMovies;
        length = MoviesListsCubit.get(context).popularMovies.length;
        break;
      case 2:
        movies = MoviesListsCubit.get(context).topRatedMovies;
        length = MoviesListsCubit.get(context).topRatedMovies.length;
        break;
      case 3:
        movies = MoviesListsCubit.get(context).upcomingMovies;
        length = MoviesListsCubit.get(context).upcomingMovies.length;
        print(length);
        break;
      default:
        debugPrint('OUT OF BOUND INDEX!');
    }

    return AnimatedPositioned(
      duration: 500.ms,
      curve: Curves.easeOut,
      top: top,
      left: left,
      child: SizedBox(
        width: 80 + (4 * 250),
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: List.generate(
            length,
            (index) => Transform.translate(
              offset: Offset(0, index.isEven ? 240 : 0),
              child: Movie(
                movie: movies[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
