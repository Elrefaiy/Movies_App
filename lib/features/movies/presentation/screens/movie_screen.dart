import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_application/core/widgets/blur_button.dart';
import 'package:movies_application/features/movies/presentation/cubit/movies_cubit.dart';

import '../../../../core/utils/app_strings.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        if (state is GetMovieDetailsLoading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is GetMovieDetailsSuccessfully) {
          final movie = MoviesCubit.get(context).movie;
          return Scaffold(
              body: Blur(
            blur: 15,
            blurColor: Colors.black,
            child: Column(
              children: [
                Image(
                  image: NetworkImage(
                    '${AppStrings.imageBase}${movie.backdropPath}',
                  ),
                  height: 300,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
              ],
            ),
            overlay: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      BlurButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icons.keyboard_arrow_left_rounded,
                      ),
                      Spacer(),
                      BlurButton(
                        onPressed: () {},
                        icon: Icons.more_horiz_rounded,
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          width: 150,
                          height: 220,
                          image: NetworkImage(
                            '${AppStrings.imageBase}${movie.posterPath}',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              movie.title,
                              style: Theme.of(context).textTheme.displayLarge,
                              maxLines: 2,
                            ),
                            Text(
                              movie.tagline,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                              maxLines: 2,
                            ),
                            SizedBox(height: 5),
                            Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              children: List.generate(
                                movie.genres.length,
                                (index) {
                                  return Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(.5),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      movie.genres[index].name,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Run Time: ${(movie.runtime / 60).truncate()}h  ${movie.runtime.remainder(60)}min',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            Text(
                              'Status: ${movie.status}',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            Text(
                              'Budget: ${movie.budget} \$',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            Text(
                              'Revenue: ${movie.revenue} \$',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Column(
                                //   children: [
                                //     Icon(
                                //       Icons.favorite,
                                //       color: Colors.redAccent,
                                //       size: 20,
                                //     ),
                                //     Text(
                                //       movie.voteAverage.ceil().toString(),
                                //       style: Theme.of(context)
                                //           .textTheme
                                //           .displaySmall,
                                //     ),
                                //   ],
                                // ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.local_fire_department_rounded,
                                      color: Colors.orangeAccent,
                                      size: 20,
                                    ),
                                    Text(
                                      movie.popularity.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.calendar_month,
                                      color: Colors.blue.shade200,
                                      size: 20,
                                    ),
                                    Text(
                                      movie.releaseDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.greenAccent,
                                        backgroundColor:
                                            Colors.grey.withOpacity(.4),
                                        value: .8,
                                      ),
                                      Text(
                                        '80%',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 45,
                    margin: const EdgeInsets.symmetric(vertical: 25),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_arrow_rounded,
                          size: 34,
                          color: Colors.white,
                        ),
                        Text(
                          'Play Trailer',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade800,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Summaries',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(height: 5),
                  Text(
                    movie.overview,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
            ),
          ));
        } else {
          return Scaffold(
            body: Center(
              child: Text(
                'ERRRRRROR!',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          );
        }
      },
    );
  }
}
