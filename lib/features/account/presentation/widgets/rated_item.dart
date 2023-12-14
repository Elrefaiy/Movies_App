import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../movies/presentation/cubit/movies_cubit.dart';
import '../../domain/entities/rated.dart';

class RatedItem extends StatelessWidget {
  final RatedResult movie;
  const RatedItem({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MoviesCubit.get(context).getMovieDetails(
          id: movie.id,
        );
        Navigator.pushNamed(
          context,
          Routes.movieDetails,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Image(
              height: double.infinity,
              image: NetworkImage(
                '${AppStrings.imageBase}${movie.posterPath}',
              ),
              fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              padding: const EdgeInsets.all(5),
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
                    size: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
