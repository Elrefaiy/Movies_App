import 'package:flutter/material.dart';
import 'package:movies_application/config/themes/app_theme.dart';
import 'package:movies_application/features/onboarding/presentation/screens/onboarding_screen.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme(),
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
    );
  }
}
