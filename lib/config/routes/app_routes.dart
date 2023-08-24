import 'package:flutter/material.dart';
import '../../features/movies/presentation/screens/movie_screen.dart';
import '../../features/movies_lists/presentation/screens/movies_home.dart';
import '../../features/authentication/presentation/screens/auth_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';

class Routes {
  // static const String initial = '/';
  static const String onboarding = '/onboarding';
  static const String auth = '/authentication';
  static const String moviesHome = '/moviesHome';
  static const String movieDetails = '';
}

class AppRoutes {
  static Route? onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
        );
      case Routes.auth:
        return MaterialPageRoute(
          builder: (context) => AuthScreen(),
        );
      case Routes.moviesHome:
        return MaterialPageRoute(
          builder: (context) => MoviesHomeScreen(),
        );
      case Routes.movieDetails:
        return MaterialPageRoute(
          builder: (context) => MovieScreen(),
        );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(
            'No Route Found!',
          ),
        ),
      ),
    );
  }
}
