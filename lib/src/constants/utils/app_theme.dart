import 'package:flutter/material.dart';
import 'package:restaurantmanagement/src/constants/utils/app_colors.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme = ThemeData(
    canvasColor: AppColors.backGroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkGrey,
      elevation: 0,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: AppColors.backGroundColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkGrey,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
