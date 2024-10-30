import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  var selectedIndex = 0.obs;

  // Method to update the selected index
  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
