import 'package:adfix/constants/constant.dart';
import 'package:flutter/material.dart';

class ServiceFeatures extends StatelessWidget {
  final String text;

  const ServiceFeatures({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/tick.png',
          width: 25,
          height: 25,
          scale: 1,
        ),
        const SizedBox(width: 8),
        Text(text, style: bodysmall400),
      ],
    );
  }
}
