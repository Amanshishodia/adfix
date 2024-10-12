import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mybookingpage extends StatelessWidget {
  const Mybookingpage({super.key});

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
      title: Text("My Booking "),
    ));
  }
}
