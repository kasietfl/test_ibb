import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final void Function()? onTap;
  final IconData? suffixIcon;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.onTap,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTap: onTap,
      decoration: InputDecoration(
        suffixIcon: Icon(suffixIcon),
        filled: true,
        fillColor: Colors.grey[200],
        hintText: hintText,
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
