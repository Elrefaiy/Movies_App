import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'bloc_observer.dart';
import 'core/utils/app_strings.dart';
import 'features/authentication/presentation/screens/auth_screen.dart';
import 'features/movies_lists/presentation/screens/movies_home.dart';
import 'features/onboarding/presentation/screens/onboarding_screen.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = AppBlocObserver();
  final String session =
      di.sl<SharedPreferences>().getString(AppStrings.sessionId) ?? '';
  print(session);
  final bool firstTime =
      di.sl<SharedPreferences>().getBool(AppStrings.firstTime) ?? true;
  Widget widget = firstTime ? OnboardingScreen() : AuthScreen();
  if (session != '') {
    widget = MoviesHomeScreen();
  }
  runApp(
    MoviesApp(
      startWidget: widget,
    ),
  );
}
