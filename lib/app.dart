import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_application/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:movies_application/features/authentication/presentation/screens/auth_screen.dart';

import 'config/themes/app_theme.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(),
      child: MaterialApp(
        theme: AppTheme(),
        debugShowCheckedModeBanner: false,
        home: const AuthScreen(),
      ),
    );
  }
}
