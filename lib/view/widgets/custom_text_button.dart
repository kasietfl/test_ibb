import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final void Function() onPress;
  final String title;
  const CustomTextButton(
      {super.key, required this.onPress, required this.title});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPress,
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, decoration: TextDecoration.underline),
        ));
  }
}
