import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: myMaterialColor,
    primaryColorLight: myMaterialColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    unselectedWidgetColor: Colors.grey[350],

    // primaryColor: AppColors.appBarText,
    appBarTheme: AppBarTheme(
      elevation: 0,
      // backgroundColor: AppColors.appBarBackground,
      iconTheme: IconThemeData(color: myMaterialColor, size: 24),
      titleTextStyle: TextStyle(
          // color: AppColors.appBarText,
          fontSize: 17,
          fontWeight: FontWeight.w500),
    ),
  );

  static MaterialColor? myMaterialColor = MaterialColor(
    0xFF384878,
    {
      50: Color(0xFFB2C1D8),
      100: Color(0xFF8FA1C9),
      200: Color(0xFF6D81BA),
      300: Color(0xFF4A61AB),
      400: Color(0xFF324B97),
      500: Color(0xFF384878), // Primary color
      600: Color(0xFF2F3E69),
      700: Color(0xFF26315A),
      800: Color(0xFF1D254B),
      900: Color(0xFF13193D),
    },
  );
}
