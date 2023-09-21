import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/entities/movie_details.dart';

class MovieInfo extends StatelessWidget {
  final MovieDetails movie;
  const MovieInfo({
    required this.movie,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
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
                'Votes: ${movie.voteCount}',
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
                  Column(
                    children: [
                      Icon(
                        Icons.local_fire_department_rounded,
                        color: Colors.orangeAccent,
                        size: 20,
                      ),
                      Text(
                        movie.popularity.toString(),
                        style: Theme.of(context).textTheme.displaySmall,
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
                        style: Theme.of(context).textTheme.displaySmall,
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
                          color: movie.voteAverage < 7
                              ? Colors.yellowAccent
                              : movie.voteAverage < 5
                                  ? Colors.redAccent
                                  : Colors.greenAccent,
                          backgroundColor: Colors.grey.withOpacity(.4),
                          value: movie.voteAverage / 10,
                        ),
                        Text(
                          '${(movie.voteAverage * 10).round()}%',
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
    );
  }
}
