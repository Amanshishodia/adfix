// cart_controller.dart
import 'package:flutter/material.dart';
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
  final _total = 0.0.obs;

  // Add this to save cart data when app closes
  @override
  void onClose() {
    // Here you could add persistence if needed
    super.onClose();
  }

  void updateTotalWithTip(double tipAmount) {
    _total.value = _total.value + tipAmount;
  }

  void addItem(CartItem item) {
    final existingItemIndex = cartItems.indexWhere(
      (element) => element.id == item.id,
    );

    if (existingItemIndex >= 0) {
      // Item exists, increment quantity
      cartItems[existingItemIndex].quantity++;
    } else {
      // New item, add to cart
      cartItems.add(item);
    }

    calculateTotal();

    Get.snackbar(
      'Added to Cart',
      '${item.name} added to cart',
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 2),
      backgroundColor: Colors.green[900],
      colorText: Colors.white,
      margin: EdgeInsets.all(8),
    );
  }

  void removeItem(String id) {
    cartItems.removeWhere((item) => item.id == id);
    calculateTotal();
  }

  void incrementQuantity(String id) {
    final itemIndex = cartItems.indexWhere((item) => item.id == id);
    if (itemIndex >= 0) {
      cartItems[itemIndex].quantity++;
      calculateTotal();
    }
  }

  void decrementQuantity(String id) {
    final itemIndex = cartItems.indexWhere((item) => item.id == id);
    if (itemIndex >= 0) {
      if (cartItems[itemIndex].quantity > 1) {
        cartItems[itemIndex].quantity--;
      } else {
        cartItems.removeAt(itemIndex);
      }
      calculateTotal();
    }
  }

  void calculateTotal() {
    total.value = cartItems.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity.value),
    );
  }

  int get itemCount => cartItems.length;
}
