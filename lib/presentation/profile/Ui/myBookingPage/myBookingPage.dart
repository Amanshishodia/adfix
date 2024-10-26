import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBookingPage extends StatelessWidget {
  const MyBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          // Add const for better performance
          onPressed: () {
            Get.back(); // Go back to the previous page
          },
        ),
        title: const Text("My Booking"),
        centerTitle: true, // Center the title for better UX
      ),
      body: Center(
        child: const Text(
          'No bookings yet!', // Placeholder content
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
