import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/cast.dart';
import '../widgets/crew.dart';
import '../../../../config/routes/app_routes.dart';
import '../cubit/movies_cubit.dart';
import '../widgets/header.dart';
import '../widgets/movie_info.dart';
import '../../../../core/utils/app_strings.dart';
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
              overlay: Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 50,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 75),
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade800,
                          ),
                          SizedBox(height: 10),
                          // SizedBox(
                          //   height: 150,
                          //   child: ListView.separated(
                          //     physics: BouncingScrollPhysics(),
                          //     shrinkWrap: true,
                          //     scrollDirection: Axis.horizontal,
                          //     itemCount: cubit.videos.length,
                          //     itemBuilder: (context, index) {
                          //       return VideoWidget(
                          //         videoKey: cubit.videos[index].key,
                          //       );
                          //     },
                          //     separatorBuilder: (context, index) {
                          //       return SizedBox(
                          //         width: 10,
                          //       );
                          //     },
                          //   ),
                          // ),
                          SizedBox(height: 10),
                          Divider(
                            color: Colors.grey.shade800,
                          ),
                          Text(
                            'Summaries',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(height: 5),
                          Text(
                            movie.overview,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Casts',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            height: 210,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
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
                            'Crew',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            height: 210,
                            child: ListView.separated(
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
                        ],
                      ),
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
