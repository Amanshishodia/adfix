import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateButton extends StatelessWidget {
  final DateTime date;
  final bool isSelected;
  final VoidCallback onTap;

  const DateButton({
    Key? key,
    required this.date,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 18),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple[100] : Colors.white,
          border: Border.all(
            color: const Color.fromARGB(255, 102, 50, 207),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              DateFormat('EEE').format(date),
              // Ensure date is formatted correctly
              style: TextStyle(
                color: isSelected ? Colors.deepPurple : Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              date.day.toString(),
              style: TextStyle(
                color: isSelected ? Colors.deepPurple : Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
