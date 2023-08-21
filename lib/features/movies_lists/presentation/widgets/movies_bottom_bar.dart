import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../cubit/movies_lists_cubit.dart';

class MoviesBottomBar extends StatelessWidget {
  const MoviesBottomBar({super.key});

  Column tap(context, int index, IconData icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            MoviesListsCubit.get(context).changeCurrentListIndex(index);
          },
          child: Icon(
            icon,
            color: index == MoviesListsCubit.get(context).currentListIndex
                ? Colors.white
                : Colors.white.withOpacity(.6),
            size: 30,
          ),
        ),
        SizedBox(height: 5),
        if (index == MoviesListsCubit.get(context).currentListIndex)
          Icon(
            Icons.circle,
            color: Colors.white,
            size: 7,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Blur(
          blur: 5,
          blurColor: AppColors.blur,
          colorOpacity: .4,
          borderRadius: BorderRadius.circular(25),
          child: SizedBox(
            width: 250,
            height: 60,
          ),
          overlay: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              tap(context, 0, Icons.play_arrow_rounded),
              tap(context, 1, Icons.sentiment_neutral_sharp),
              tap(context, 2, Icons.star_rate_rounded),
              tap(context, 3, Icons.access_time_filled_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
