import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../movies/presentation/cubit/movies_cubit.dart';
import '../../domain/entities/search_movie.dart';

class SearchMovieWidget extends StatelessWidget {
  final SearchResult result;
  const SearchMovieWidget({
    required this.result,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        MoviesCubit.get(context).getMovieDetails(
          id: result.id,
        );
        Navigator.pushNamed(
          context,
          Routes.movieDetails,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Blur(
          blurColor: Colors.black,
          blur: 1,
          child: Image(
            width: double.infinity,
            height: 160,
            image: NetworkImage(
              result.backdropPath == ''
                  ? AppStrings.noImage
                  : '${AppStrings.imageBase}${result.backdropPath}',
            ),
            fit: BoxFit.cover,
          ),
          overlay: Row(
            children: [
              Image(
                width: 120,
                height: double.infinity,
                fit: BoxFit.cover,
                image: NetworkImage(
                  result.posterPath == ''
                      ? AppStrings.noImage
                      : '${AppStrings.imageBase}${result.posterPath}',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      result.title,
                      style: Theme.of(context).textTheme.displayMedium,
                      maxLines: 2,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Released in : ${result.releaseDate}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      result.overview,
                      style: Theme.of(context).textTheme.displaySmall,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Spacer(),
                        Icon(
                          Icons.star_rounded,
                          color: Colors.amberAccent,
                          size: 16,
                        ),
                        Text(
                          result.voteAverage.toString().substring(0, 3),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                          size: 16,
                        ),
                        Text(
                          result.popularity.toString(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
