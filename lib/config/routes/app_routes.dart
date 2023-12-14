import 'package:flutter/material.dart';

import '../../features/account/presentation/screens/favorite_screen.dart';
import '../../features/account/presentation/screens/rated_movies_screen.dart';
import '../../features/authentication/presentation/screens/auth_screen.dart';
import '../../features/authentication/presentation/screens/auth_web_screen.dart';
import '../../features/movies/presentation/screens/images_screen.dart';
import '../../features/movies/presentation/screens/movie_screen.dart';
import '../../features/movies/presentation/screens/trailer_screen.dart';
import '../../features/movies_lists/presentation/screens/movies_home.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/search/presentation/screens/search_movie_screen.dart';

class Routes {
  // static const String initial = '/';
  static const String onboarding = '/onboarding';
  static const String auth = '/authentication';
  static const String authWeb = '/authenticationWeb';
  static const String moviesHome = '/moviesHome';
  static const String movieDetails = '/movieDetails';
  static const String movieTrailer = '/movieTrailer';
  static const String searchMovie = '/searchMovie';
  static const String movieImages = '/movieImages';
  static const String favorites = '/favorites';
  static const String ratedMovies = '/ratedMovies';
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
      case Routes.authWeb:
        final requestToken = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => AuthWebScreen(
            requestToken: requestToken,
          ),
        );
      case Routes.moviesHome:
        return MaterialPageRoute(
          builder: (context) => MoviesHomeScreen(),
        );
      case Routes.movieDetails:
        return MaterialPageRoute(
          builder: (context) => MovieScreen(),
        );
      case Routes.movieTrailer:
        {
          final movieKey = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => TrailerScreen(
              movieKey: movieKey,
            ),
          );
        }
      case Routes.searchMovie:
        return MaterialPageRoute(
          builder: (context) => SearchMovieScreen(),
        );
      case Routes.favorites:
        return MaterialPageRoute(
          builder: (context) => FavoriteScreen(),
        );
      case Routes.ratedMovies:
        return MaterialPageRoute(
          builder: (context) => RatedMoviesScreen(),
        );
      case Routes.movieImages:
        return MaterialPageRoute(
          builder: (context) => ImagesScreen(),
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
