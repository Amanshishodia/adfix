import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String image;
  final String text;

  const CustomCard({Key? key, required this.image, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 80, // Fixed height for image container
          width: 90, // Fixed width for image container
          decoration: BoxDecoration(
            color: Colors.grey[270],
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                image,
                height: 50,
                width: 50,
              ),
            ),
          ),
        ),
        const SizedBox(height: 1), // Space between image and text
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 3,
        ),
      ],
    );
  }
}
