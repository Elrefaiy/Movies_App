import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/functions.dart';
import '../cubit/authentication_cubit.dart';
import '../widgets/authorization_widget.dart';
import '../widgets/create_session_widget.dart';

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
            child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
              listener: (context, state) {
                if (state is CreateGuestSessionSuccess) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.moviesHome,
                    (route) => false,
                  );
                  AppFunctions.showSnakBar(
                    context: context,
                    lable: 'Hello there guest, have a good time!',
                    icon: Icons.done_rounded,
                    iconColor: Colors.greenAccent,
                    duration: 2,
                  );
                } else if (state is CreateGuestSessionError) {
                  AppFunctions.showSnakBar(
                    context: context,
                    lable: 'Network Error, try to reconnect please',
                    icon: Icons.signal_wifi_connected_no_internet_4_rounded,
                    iconColor: Colors.redAccent,
                    duration: 2,
                  );
                }
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                            'Authorization',
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
                            'Create Session',
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
                        dotWidth: 83.2,
                        radius: 2,
                        dotHeight: 2,
                        spacing: 10,
                        dotColor: Colors.transparent,
                        activeDotColor: Colors.white,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        cubit.createGuestSession();
                      },
                      child: Text(
                        'Continue as a Guest',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
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
