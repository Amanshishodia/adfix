import 'package:flutter/material.dart';

class SearchServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color of the Scaffold to white
      appBar: AppBar(
        backgroundColor: Colors.white,
        // elevation: 1.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Box
            TextField(
              decoration: InputDecoration(
                hintText: "Search for 'AC service'",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            
            // Use Current Location
            Row(
              children: [
                Icon(Icons.my_location, color: Colors.black),
                SizedBox(width: 8.0),
                Text(
                  'Use current location',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}