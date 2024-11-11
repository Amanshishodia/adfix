import 'package:flutter/material.dart';

class ProfileItems extends StatelessWidget {
  final VoidCallback ontap;
  final String image;
  final String text;

  const ProfileItems(
      {super.key,
      required this.ontap,
      required this.text,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  image,
                  height: 18,
                  width: 18,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  text,
                  style: TextStyle(fontSize: 12, color: Colors.black),
                )
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 10,
            )
          ],
        ),
      ),
    );
  }
}
