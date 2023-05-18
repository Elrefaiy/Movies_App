import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

ThemeData AppTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: AppColors.primary,
    hintColor: AppColors.hint,
  );
}
