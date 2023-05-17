import 'package:flutter/material.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Image(
                image: AssetImage(
                  'assets/images/img1.jpg',
                ),
                fit: BoxFit.cover,
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
              colors: const [
                Color(0xFF213538),
                Color(0xFF3A5C63),
                Color(0x006B9098),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 150),
              Text(
                'REAL TIME',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Movie & TV information and updates movie trailer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
