import 'package:flutter/material.dart';

class TimeButton extends StatelessWidget {
  final String time;
  final bool isSelected;
  final VoidCallback onTap;

  const TimeButton({
    Key? key,
    required this.time,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple[100] : Colors.white,
          border: Border.all(
            color: const Color.fromARGB(255, 214, 214, 214),
          ),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Center(
          child: Text(
            time,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.w300,
              color: isSelected ? Colors.deepPurple : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
