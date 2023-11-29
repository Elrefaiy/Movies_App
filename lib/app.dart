import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_application/features/authentication/presentation/screens/request_token_screen.dart';
import 'features/authentication/presentation/screens/auth_screen.dart';
import 'features/search/presentation/cubit/search_cubit.dart';
import 'features/authentication/presentation/cubit/authentication_cubit.dart';
import 'features/movies/presentation/cubit/movies_cubit.dart';
import 'features/movies_lists/presentation/cubit/movies_lists_cubit.dart';
import 'features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'injection_container.dart' as di;

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<OnboardingCubit>(),
        ),
        BlocProvider(
          create: (context) =>
              di.sl<AuthenticationCubit>()..createRequestToken(),
        ),
        BlocProvider(
          create: (context) => di.sl<MoviesListsCubit>()..getNowPlaying(),
        ),
        BlocProvider(
          create: (context) => di.sl<MoviesCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<SearchCubit>(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: AppRoutes.onGeneratedRoute,
        theme: AppTheme(),
        debugShowCheckedModeBanner: false,
        home: const RequestTokenScreen(),
      ),
    );
  }
}
