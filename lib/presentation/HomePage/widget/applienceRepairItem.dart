import 'package:flutter/material.dart';

class Appliencerepairitem extends StatelessWidget {
  const Appliencerepairitem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, // Increased height to prevent overflow
      width: 85,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey, // Grey color border
          width: 1.0, // Border width
        ),
        borderRadius: BorderRadius.circular(8.0), // Rounded corners
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              'AC Repair & Services',
              textAlign: TextAlign.center, // Center-align the text
              style: const TextStyle(
                fontSize: 10, // Adjust the font size
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            // Same border radius as the container
            child: Image.asset(
              'assets/images/acservice.png',
              height: 62,
              width: 104,
              fit: BoxFit.cover, // Ensures image covers the space nicely
            ),
          ),
        ],
      ),
    );
  }
}
