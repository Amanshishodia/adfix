import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  const Option({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 60,
            width: 61,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[400]),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Super Saver \n Combos",
            style: TextStyle(fontSize: 8),
          )
        ],
      ),
    );
  }
}
