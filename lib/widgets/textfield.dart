import 'package:flutter/material.dart';

import '../utils/appcolor.dart';

class CustomTextfield extends StatelessWidget {
  final String label;

  const CustomTextfield({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: AppColor.captionColor),
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColor.captionColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.5, color: Colors.black54))),
    );
  }
}
