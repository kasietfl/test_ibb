import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_ibb/bloc/trip_bloc/trip_bloc.dart';
import 'package:test_ibb/view/screens/home_screen.dart';
import 'package:test_ibb/view/widgets/custom_button.dart';
import 'package:test_ibb/view/widgets/custom_text_button.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 165, 194, 249),
              Color.fromARGB(255, 95, 147, 189),
            ],
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Spacer(),
            const Text(
              "BUS FINDER APP",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            const SizedBox(height: 20),
            Image.asset("assets/images/bus.png"),
            const SizedBox(height: 80),
            CustomButton(
                title: "Get Started", onPress: () => navigateToHome(context)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextButton(
                    onPress: _launchUrl, title: "Terms and Conditions"),
                CustomTextButton(onPress: _launchUrl, title: "Privacy Policy")
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => TripBloc(),
                  child: const HomeScreen(),
                )));
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse("https://pub.dev/"))) {
      throw Exception('Could not launch ');
    }
  }
}
