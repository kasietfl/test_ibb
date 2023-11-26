import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_ibb/theme.dart';
import 'package:test_ibb/bloc/trip_bloc/trip_bloc.dart';
import 'package:test_ibb/view/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripBloc(),
      child: MaterialApp(
          title: 'Test Trip Finder',
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          home: const SplashScreen()),
    );
  }
}
