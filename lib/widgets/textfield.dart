import 'package:flutter/material.dart';

import '../utils/appcolor.dart';

class CustomTextfield extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool obscure; // Changed to 'bool'

  const CustomTextfield({
    super.key,
    required this.label,
    this.controller,
    this.obscure = false, // Set default value as 'false'
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure, // Use the correct obscure field
      controller: controller, // Set the controller
      style: TextStyle(color: Colors.black54),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColor.captionColor),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1.5, color: Colors.black54),
        ),
      ),
    );
  }
}
