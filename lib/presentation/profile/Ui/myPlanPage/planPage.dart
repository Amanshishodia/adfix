import 'package:flutter/material.dart';

class MyPlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'My plan',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Add functionality for Help button
            },
            child: Text(
              'Help',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            style: TextButton.styleFrom(
              side: BorderSide(color: Colors.grey), // Grey border around the button
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0), // Rounded corners with radius 8.0
              ),
              padding: EdgeInsets.all(10) // Padding from right
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 26.0), // Add space between AppBar and grey area
          Container(
            width: double.infinity,
            color: Colors.grey[300], // Light grey background for the section
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Active Plans',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  'You have no active plans',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
