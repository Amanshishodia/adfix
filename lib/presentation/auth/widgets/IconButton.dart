import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final String name;
  final VoidCallback dothis;
  final Color textcolor;
  final Color backGroundColor;
  final Image image;

  const CustomIconButton({
    super.key,
    required this.textcolor,
    required this.backGroundColor,
    required this.dothis,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      // Centering for testing visibility
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: GestureDetector(
          onTap: dothis,
          child: Container(
            decoration: BoxDecoration(
              color: backGroundColor, // Ensure this is a contrasting color
              borderRadius: BorderRadius.circular(3),
            ),
            width: 232,
            // Testing with smaller width
            height: 45,
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: image, // Ensure the image is properly loaded
                ),
                SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      name,
                      style: TextStyle(color: Color(0xff768195)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
