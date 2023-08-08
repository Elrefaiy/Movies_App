import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Movie extends StatelessWidget {
  const Movie({super.key});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(
          duration: 1.seconds,
        ),
      ],
      child: Container(
        margin: EdgeInsets.only(
          top: 25,
        ),
        width: 200,
        height: 370,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: AssetImage('assets/images/img1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
