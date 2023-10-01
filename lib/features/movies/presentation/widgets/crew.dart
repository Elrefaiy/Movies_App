import 'package:flutter/material.dart';
import '../../domain/entities/credit.dart';

import '../../../../core/utils/app_strings.dart';

class CrewCard extends StatelessWidget {
  final Crew crew;
  const CrewCard({
    required this.crew,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 120,
        height: 210,
        color: Colors.grey[900],
        child: Column(
          children: [
            Expanded(
              child: Image(
                width: double.infinity,
                image: NetworkImage(
                  crew.profilePath == ''
                      ? AppStrings.emptyAvatar
                      : '${AppStrings.imageBase}${crew.profilePath}',
                ),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    crew.name,
                    style: Theme.of(context).textTheme.displaySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '"${crew.job}"',
                    style: Theme.of(context).textTheme.displaySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        crew.popularity.toString(),
                        style: Theme.of(context).textTheme.displaySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.redAccent,
                        size: 14,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
