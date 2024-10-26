import 'package:flutter/material.dart';

class Offer extends StatelessWidget {
  final String img;
  final String text1;
  final String text2;

  const Offer(
      {super.key, required this.img, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey, // Border color
          width: 1.5, // Border width
        ),
        borderRadius:
            BorderRadius.circular(5), // Optional: Add rounded corners if needed
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(img),
            SizedBox(width: 3), // Add some spacing between the image and text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text1,
                  style: TextStyle(fontSize: 6, fontWeight: FontWeight.bold),
                ),
                Text(
                  text2,
                  style: TextStyle(fontSize: 6),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
