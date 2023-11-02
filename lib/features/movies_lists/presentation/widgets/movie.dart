import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../movies/presentation/cubit/movies_cubit.dart';
import '../../domain/entities/movies_list.dart';
import 'movie_dialog.dart';

class Movie extends StatelessWidget {
  final Result movie;
  const Movie({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(
          duration: 1.seconds,
        ),
      ],
      child: GestureDetector(
        onTap: () {
          MoviesCubit.get(context).getMovieDetails(
            id: movie.id,
          );
          Navigator.pushNamed(
            context,
            Routes.movieDetails,
          );
        },
        onLongPress: () {
          showDialog(
            context: context,
            builder: (context) {
              return MovieDialog(movie: movie);
            },
          );
        },
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(
                width: 250,
                height: 450,
                image: NetworkImage(
                  '${AppStrings.imageBase}${movie.posterPath}',
                ),
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null)
                    return child;
                  else
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade900,
                      highlightColor: Colors.grey.shade800,
                      child: Container(
                        width: 250,
                        height: 450,
                        color: Colors.grey[900],
                      ),
                    );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    movie.voteAverage.toString().substring(0, 3),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Icon(
                    Icons.star_rounded,
                    color: Colors.amberAccent,
                    size: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
