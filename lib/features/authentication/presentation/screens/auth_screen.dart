import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../cubit/authentication_cubit.dart';
import '../widgets/signin_widget.dart';
import '../widgets/signup_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = AuthenticationCubit.get(context);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: cubit.pageController,
            onPageChanged: (index) {
              cubit.chageIndex(index);
            },
            children: [
              SignInWidget(),
              SignUpWidget(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 35,
            ),
            child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            cubit.chageIndex(0);
                            cubit.pageController.previousPage(
                              duration: 500.ms,
                              curve: Curves.linearToEaseOut,
                            );
                          },
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(
                              color: cubit.currentIndex == 0
                                  ? Colors.white
                                  : Colors.white.withOpacity(.6),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        TextButton(
                          onPressed: () {
                            cubit.chageIndex(1);
                            cubit.pageController.nextPage(
                              duration: 500.ms,
                              curve: Curves.linearToEaseOut,
                            );
                          },
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                              color: cubit.currentIndex == 1
                                  ? Colors.white
                                  : Colors.white.withOpacity(.6),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SmoothPageIndicator(
                      controller: cubit.pageController,
                      count: 2,
                      effect: WormEffect(
                        dotWidth: 64,
                        radius: 2,
                        dotHeight: 2,
                        spacing: 10,
                        dotColor: Colors.transparent,
                        activeDotColor: Colors.white,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
