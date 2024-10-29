import 'package:adfix/presentation/HomePage/controller/CartController.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController(),
        permanent: true); // Make it permanent so it persists
  }
}
