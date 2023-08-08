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
  );
}
