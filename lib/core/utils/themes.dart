import 'package:bookia/core/utils/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // ignore: non_constant_identifier_names
  static ThemeData LightTheme = ThemeData(
      fontFamily: 'DMSerifDisplay',
      scaffoldBackgroundColor: AppColors.whiteColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        onSurface: AppColors.blackColor,
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: AppColors.whiteColor,
        headerForegroundColor: AppColors.primaryColor,
      ),
      timePickerTheme: TimePickerThemeData(
          backgroundColor: AppColors.whiteColor,
          dialBackgroundColor: AppColors.primaryColor,
          hourMinuteColor: AppColors.primaryColor,
          dayPeriodColor: AppColors.accentColor,
          hourMinuteTextColor: AppColors.textColor),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.accentColor,
        filled: true,
        hintStyle: TextStyle(fontSize: 15, color: AppColors.borderColor),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.borderColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.primaryColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.redColor)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.redColor)),
      ));
}
