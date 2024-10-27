// cart_controller.dart
import 'package:get/get.dart';

class CartItem {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  RxInt quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required int quantity,
  }) : quantity = quantity.obs;
}

class CartController extends GetxController {
  RxList<CartItem> cartItems = <CartItem>[].obs;
  RxDouble total = 0.0.obs;

  void addItem(CartItem item) {
    final existingItem = cartItems.firstWhere(
      (element) => element.id == item.id,
      orElse: () => item,
    );

    if (!cartItems.contains(existingItem)) {
      cartItems.add(item);
      Get.snackbar(
        'Success',
        'Item added to cart',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
    }
    calculateTotal();
  }

  void removeItem(String id) {
    cartItems.removeWhere((item) => item.id == id);
    calculateTotal();
  }

  void incrementQuantity(String id) {
    final item = cartItems.firstWhere((item) => item.id == id);
    item.quantity++;
    calculateTotal();
  }

  void decrementQuantity(String id) {
    final item = cartItems.firstWhere((item) => item.id == id);
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      removeItem(id);
    }
    calculateTotal();
  }

  void calculateTotal() {
    total.value = cartItems.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity.value),
    );
  }

  int get itemCount => cartItems.length;
}
