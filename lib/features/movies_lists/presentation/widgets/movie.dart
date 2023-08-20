import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/app_strings.dart';
import '../../domain/entities/movies_list.dart';

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
        onLongPress: () {
          showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                insetPadding: EdgeInsets.all(20),
                backgroundColor: Colors.transparent,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image(
                      width: 400,
                      height: 230,
                      image: NetworkImage(
                        '${AppStrings.imageBase}${movie.backdropPath}',
                      ),
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null)
                          return child;
                        else
                          return Container(
                            width: 400,
                            height: 230,
                            color: Colors.grey[900]!.withOpacity(.6),
                          );
                      },
                    ).blurred(
                      blurColor: Colors.black,
                      blur: 2,
                      overlay: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image(
                                width: 120,
                                height: 200,
                                image: NetworkImage(
                                  '${AppStrings.imageBase}${movie.posterPath}',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie.originalTitle,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                    maxLines: 2,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'released in ${movie.releaseDate}',
                                    style: TextStyle(
                                      color: Colors.grey[200],
                                      fontSize: 14,
                                    ),
                                    maxLines: 1,
                                  ),
                                  SizedBox(height: 10),
                                  Expanded(
                                    child: Text(
                                      movie.overview,
                                      style: TextStyle(
                                        color: Colors.grey[100],
                                        fontSize: 16,
                                      ),
                                      maxLines: 9,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ClipRRect(
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
                      return child
                        ..animate(effects: [FadeEffect(duration: 1.seconds)]);
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
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 40,
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
                    movie.voteAverage.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Icon(
                    Icons.star_rounded,
                    color: Colors.amber,
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
