import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function() onPress;

  const CustomButton({super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: onPress,
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Text(title,
                  style: const TextStyle(color: Colors.white, fontSize: 16)),
            )));
  }
}
