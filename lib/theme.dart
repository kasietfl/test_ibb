import 'package:flutter/material.dart';
import 'package:test_ibb/constants/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: AppColors.materialColor,
    primaryColorLight: AppColors.materialColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    unselectedWidgetColor: Colors.grey[350],
    iconTheme: IconThemeData(color: AppColors.materialColor?[300], size: 24),
  );
}
