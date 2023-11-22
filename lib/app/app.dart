import 'package:flutter/material.dart';
import 'package:test_ibb/theme.dart';
import 'package:test_ibb/ui/screens/auth_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test IBB',
      theme: AppTheme.lightTheme,
      home: const AuthScreen(),
    );
  }
}
