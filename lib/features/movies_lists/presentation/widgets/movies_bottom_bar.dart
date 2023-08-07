import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class MoviesBottomBar extends StatelessWidget {
  const MoviesBottomBar({super.key});

  Column tap(int index, IconData icon) {
    int currentindex = 0;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: Icon(
            icon,
            color: index == currentindex
                ? Colors.white
                : Colors.white.withOpacity(.6),
            size: 30,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        if (index == currentindex)
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
          colorOpacity: .3,
          borderRadius: BorderRadius.circular(25),
          child: SizedBox(
            width: 250,
            height: 60,
          ),
          overlay: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              tap(0, Icons.play_arrow_rounded),
              tap(1, Icons.sentiment_neutral_sharp),
              tap(2, Icons.star_rate_rounded),
              tap(3, Icons.access_time_filled_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
