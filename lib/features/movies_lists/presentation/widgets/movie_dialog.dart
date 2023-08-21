import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/blur_button.dart';
import '../../domain/entities/movies_list.dart';

class MovieDialog extends StatelessWidget {
  final Result movie;
  const MovieDialog({
    required this.movie,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      insetPadding: EdgeInsets.all(20),
      backgroundColor: Colors.black.withOpacity(.8),
      contentPadding: EdgeInsets.all(20),
      children: [
        Row(
          children: [
            RotatedBox(
              quarterTurns: 3,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.star_rounded,
                    color: Colors.amberAccent,
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    movie.voteAverage.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 20),
                  Icon(
                    Icons.favorite_rounded,
                    color: Colors.redAccent,
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    movie.popularity.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 20),
                  Icon(
                    Icons.calendar_month_rounded,
                    color: Colors.blueAccent.shade100,
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    movie.releaseDate,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 20),
                  BlurButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icons.keyboard_arrow_up_rounded,
                  )
                ],
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  image: NetworkImage(
                    '${AppStrings.imageBase}${movie.posterPath}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          movie.originalTitle,
          style: Theme.of(context).textTheme.displayLarge,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          movie.title,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 10),
        Divider(
          color: Colors.grey.shade700,
        ),
        SizedBox(height: 20),
        Text(
          'Introduction',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Text(
          movie.overview,
          style: Theme.of(context).textTheme.displaySmall,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
