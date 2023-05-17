import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/onboarding_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            children: [
              OnboardingWidget(),
              OnboardingWidget(),
              OnboardingWidget(),
              OnboardingWidget(),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 155,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 90),
              Row(
                children: [
                  SizedBox(width: 20),
                  SmoothPageIndicator(
                    controller: PageController(),
                    count: 4,
                    effect: ExpandingDotsEffect(
                      dotWidth: 10,
                      dotHeight: 10,
                      expansionFactor: 4.5,
                      dotColor: Colors.white.withOpacity(.3),
                      activeDotColor: Colors.white.withOpacity(.8),
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
              SizedBox(height: 20),
            ],
          )
        ],
      ),
    );
  }
}
