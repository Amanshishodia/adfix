import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(
          // Adding border
          color: Colors.grey, // Red border color
          width: 0.5, // Border width
        ),
        borderRadius: BorderRadius.circular(5), // Rounded corners (optional)
      ),
      child: TextButton(
        onPressed: () {
          // Add your logout logic here
          print('Logout button pressed');
        },
        child: Text(
          'Logout',
          style: TextStyle(
            color: Colors.red, // Red text color
            fontWeight: FontWeight.bold, // Bold text
            fontSize: 13, // Font size can be adjusted
          ),
        ),
      ),
    );
  }
}
