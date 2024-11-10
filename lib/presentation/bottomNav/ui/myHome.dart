import 'package:adfix/presentation/HomePage/Ui/homePage.dart';
import 'package:adfix/presentation/list/Ui/list.dart';
import 'package:adfix/presentation/profile/Ui/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller/controller.dart';
import '../widget/customBottomNavBar.dart';

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  final BottomNavBarController controller = Get.put(BottomNavBarController());
  final List<Widget> _pages = [
    HomePage(), // Replace with your actual page widgets
    ListPage(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        // Use Obx to listen for changes in selectedIndex
        return _pages[
            controller.selectedIndex.value]; // Display the selected page
      }),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: controller.selectedIndex.value,
        onItemTapped: controller.onItemTapped,
      ),
    );
  }
}
