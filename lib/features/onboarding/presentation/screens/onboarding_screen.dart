import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../injection_container.dart' as di;
import '../cubit/onboarding_cubit.dart';
import '../widgets/onboarding_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = OnboardingCubit.get(context);
    Stack body() {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              return PageView(
                onPageChanged: (index) {
                  cubit.pageChanged(index);
                },
                controller: cubit.pageController,
                children: List.generate(
                  cubit.onboardingData.length,
                  (index) {
                    return OnboardingWidget(
                      item: cubit.onboardingData[index],
                    );
                  },
                ),
              );
            },
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
                child: BlocBuilder<OnboardingCubit, OnboardingState>(
                  builder: (context, state) {
                    return TextButton(
                      onPressed: () async {
                        if (cubit.currentIndex == 3) {
                          await di.sl<SharedPreferences>().setBool(
                                AppStrings.firstTime,
                                false,
                              );
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.auth,
                            (route) => false,
                          );
                        } else {
                          cubit.pageController.nextPage(
                            duration: Duration(milliseconds: 600),
                            curve: Curves.fastOutSlowIn,
                          );
                          cubit.currentIndex++;
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            cubit.currentIndex == 3 ? 'Finish' : 'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            cubit.currentIndex == 3
                                ? Icons.done
                                : Icons.arrow_forward,
                            color: Colors.white,
                            size: 20,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 70),
              Row(
                children: [
                  SizedBox(width: 20),
                  SmoothPageIndicator(
                    controller: cubit.pageController,
                    count: cubit.onboardingData.length,
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
                    onPressed: () {
                      cubit.pageController.jumpToPage(3);
                    },
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
      );
    }

    return Scaffold(
      body: body(),
    );
  }
}
