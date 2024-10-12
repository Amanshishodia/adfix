import 'package:adfix/utils/appcolor.dart';
import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onTap;

  const Custombutton({super.key, required this.buttonText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 220,
        height: 45,
        decoration: BoxDecoration(
            color: AppColor.buttonColor,
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                color: AppColor.whiteColor,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
