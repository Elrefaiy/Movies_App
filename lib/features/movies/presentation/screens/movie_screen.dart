import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../cubit/movies_cubit.dart';
import '../widgets/cast.dart';
import '../widgets/crew.dart';
import '../widgets/header.dart';
import '../widgets/movie_info.dart';
import '../widgets/video.dart';

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
        } else {
          final movie = MoviesCubit.get(context).movie;
          return Scaffold(
            body: Blur(
              blurColor: Colors.black,
              colorOpacity: .6,
              child: Image(
                height: double.infinity,
                image: NetworkImage(
                  '${AppStrings.imageBase}${movie.backdropPath}',
                ),
                fit: BoxFit.fitHeight,
              ),
              overlay: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 130),
                        MovieInfo(movie: movie),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            RatingBar.builder(
                              glowColor: Colors.amber,
                              itemSize: 20,
                              initialRating: 1,
                              minRating: 1,
                              maxRating: 5,
                              unratedColor: Colors.grey.withOpacity(.3),
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              updateOnDrag: true,
                              itemPadding: EdgeInsets.symmetric(
                                horizontal: 3,
                              ),
                              itemBuilder: (context, _) => Icon(
                                Icons.star_rounded,
                                color: Colors.amberAccent,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
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
                            margin: const EdgeInsets.symmetric(
                              vertical: 25,
                              horizontal: 15,
                            ),
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
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          'Videos - ${cubit.videos.length}'.padLeft(15),
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        SizedBox(height: 5),
                        SizedBox(
                          height: 150,
                          child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: cubit.videos.length,
                            itemBuilder: (context, index) {
                              return VideoWidget(
                                videoKey: cubit.videos[index].key,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 10,
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Summaries'.padLeft(12),
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            movie.overview,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Casts - ${cubit.casts.length}'.padLeft(14),
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 210,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return CastCard(cast: cubit.casts[index]);
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 10);
                            },
                            itemCount: cubit.casts.length,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Crew - ${cubit.crew.length}'.padLeft(13),
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 210,
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return CrewCard(crew: cubit.crew[index]);
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 10);
                            },
                            itemCount: cubit.crew.length,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                  MoviesHeader(
                    id: movie.id,
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
