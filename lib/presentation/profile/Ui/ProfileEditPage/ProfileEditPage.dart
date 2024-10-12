import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back(); // Go back to the previous page
            },
          ),
          title: Text(
            'Profile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20, // Optional: Adjust font size if needed
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(label: Text("Name")),
                ),
                TextField(
                  decoration: InputDecoration(label: Text("Email Address")),
                ),
                TextField(
                  decoration: InputDecoration(label: Text("Mobile Number")),
                ),
              ],
            ),
          ),
        ));
  }
}
