import 'package:flutter/material.dart';
import 'package:test_ibb/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:test_ibb/view/screens/home_screen.dart';
import 'package:test_ibb/view/widgets/custom_button.dart';
import 'package:test_ibb/view/widgets/custom_text_button.dart';

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
            colors: [AppColors.lightBlue, AppColors.blue],
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
            const SizedBox(height: 90),
            CustomButton(
                title: "Get Started", onPress: () => navigateToHome(context)),
            const SizedBox(height: 8),
            CustomTextButton(
                onPress: () => _launchUrl("https://pub.dev/"),
                title: "Terms and Conditions, Privacy Policy"),
            const SizedBox(height: 8)
          ],
        ),
      ),
    );
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  Future _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
