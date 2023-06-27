import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../domain/entities/onboarding.dart';

class OnboardingWidget extends StatelessWidget {
  final Onboarding item;
  const OnboardingWidget({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 2,
              child: Animate(
                effects: [
                  FadeEffect(
                    duration: 500.ms,
                  )
                ],
                child: Image(
                  width: double.infinity,
                  image: AssetImage(
                    item.image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: item.gradiant,
            ),
          ),
          child: Animate(
            effects: [
              FadeEffect(
                duration: 1200.ms,
              ),
            ],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 200),
                Text(
                  item.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  item.content,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
