import 'package:flutter/material.dart';

class ServiceCheck extends StatelessWidget {
  final String heading;
  final String Subheading;

  const ServiceCheck(
      {Key? key, required this.heading, required this.Subheading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: TextStyle(fontSize: 14),
        ),
        Text(
          Subheading,
          style: TextStyle(fontSize: 12),
        ),
        Image.asset(
          'assets/images/tick.png',
          width: 400,
          height: 50,
          scale: 1,
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
