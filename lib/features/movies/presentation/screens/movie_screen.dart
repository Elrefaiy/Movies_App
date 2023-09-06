import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_application/config/routes/app_routes.dart';
import 'package:movies_application/features/movies/presentation/cubit/movies_cubit.dart';
import 'package:movies_application/features/movies/presentation/widgets/header.dart';
import 'package:movies_application/features/movies/presentation/widgets/movie_info.dart';
import '../../../../core/utils/app_strings.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = MoviesCubit.get(context);
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
                    MoviesHeader(),
                    SizedBox(height: 25),
                    MovieInfo(movie: movie),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.movieTrailer,
                          arguments: cubit.trailer.key,
                        );
                      },
                      child: Container(
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
            ),
          );
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
