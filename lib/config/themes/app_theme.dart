import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/app_colors.dart';

ThemeData AppTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primarySwatch: AppColors.primary,
    primaryColor: AppColors.primary,
    hintColor: AppColors.hint,
    appBarTheme: AppBarTheme(
      color: Colors.grey.shade900,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        fontSize: 26,
        color: Colors.white,
        height: 1,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: Colors.white,
        height: 1,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w200,
        fontSize: 12,
        color: Colors.grey[300],
      ),
    ),
  );
}
