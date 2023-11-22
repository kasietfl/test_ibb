import 'package:flutter/material.dart';
import 'package:test_ibb/ui/screens/home_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Text("Get Started")),
          TextButton(onPressed: () {}, child: Text("Terms and Conditions")),
          TextButton(onPressed: () {}, child: Text("Privacy Policy"))
        ],
      ),
    );
  }
}
