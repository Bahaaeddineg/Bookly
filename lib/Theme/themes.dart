import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class AppTheme {
  static TextTheme textTheme = const TextTheme(
    titleLarge: TextStyle(
      color: AppColors.kWhite,
      fontSize: 50,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: AppColors.kWhite,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      color: AppColors.kWhite,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
  );

  static ThemeData dark() {
    return ThemeData(
        scaffoldBackgroundColor: AppColors.kPrimaryColor, textTheme: textTheme);
  }
  static ThemeData light() {
    return ThemeData(
        scaffoldBackgroundColor: Colors.amber, textTheme: textTheme);
  }
}
