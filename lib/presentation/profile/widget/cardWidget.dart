import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String image;
  final VoidCallback? ontap;

  final String text;

  const CardWidget({
    super.key,
    required this.text,
    required this.image,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 71,
        width: 92,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          // Set border radius
          border:
              Border.all(color: Colors.grey, width: 0.5), // Add black border
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // Center the image vertically
            children: [
              Image.asset(
                image,
                height: 22,
                width: 22,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
