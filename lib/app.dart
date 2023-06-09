import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_application/features/movies_lists/presentation/cubit/movies_lists_cubit.dart';
import 'package:movies_application/features/onboarding/presentation/screens/onboarding_screen.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'features/authentication/presentation/cubit/authentication_cubit.dart';
import 'features/onboarding/presentation/cubit/onboarding_cubit.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnboardingCubit(),
        ),
        BlocProvider(
          create: (context) => AuthenticationCubit(),
        ),
        BlocProvider(
          create: (context) => MoviesListsCubit(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: AppRoutes.onGeneratedRoute,
        theme: AppTheme(),
        debugShowCheckedModeBanner: false,
        home: const OnboardingScreen(),
      ),
    );
  }
}
