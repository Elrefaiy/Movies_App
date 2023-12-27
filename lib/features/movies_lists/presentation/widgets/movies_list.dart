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
    final MoviesListsCubit cubit = MoviesListsCubit.get(context);
    switch (currentIndex) {
      case 0:
        movies = cubit.nowPlayingMovies;
        length = cubit.nowPlayingMovies.length;
        break;
      case 1:
        movies = cubit.popularMovies;
        length = cubit.popularMovies.length;
        break;
      case 2:
        movies = cubit.topRatedMovies;
        length = cubit.topRatedMovies.length;
        break;
      case 3:
        movies = cubit.upcomingMovies;
        length = cubit.upcomingMovies.length;
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
        width: 1080,
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
