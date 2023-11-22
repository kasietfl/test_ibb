import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.cyan,
    primaryColorLight: Colors.cyan,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    unselectedWidgetColor: Colors.grey[350],
    // primaryColor: AppColors.appBarText,
    appBarTheme: AppBarTheme(
      elevation: 0,
      // backgroundColor: AppColors.appBarBackground,
      iconTheme: IconThemeData(
          // color: AppColors.appBarIcon,
          ),
      titleTextStyle: TextStyle(
          // color: AppColors.appBarText,
          fontSize: 17,
          fontWeight: FontWeight.w500),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Colors.black87,
      // selectedItemColor: AppColors.colors[700],
    ),
  );
}
