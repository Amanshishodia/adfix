// cart_summary_widget.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentation/HomePage/controller/CartController.dart';
import '../presentation/summary/ui/SummaryPage.dart';

class CartSummaryWidget extends StatelessWidget {
  CartSummaryWidget({Key? key}) : super(key: key);

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (cartController.itemCount == 0) return SizedBox.shrink();

      return Container(
        padding: EdgeInsets.only(
          bottom:
              MediaQuery.of(context).padding.bottom, // Account for safe area
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8),
              color: Colors.green[900],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${cartController.itemCount} ${cartController.itemCount == 1 ? 'item' : 'items'} in cart",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "₹${cartController.total.value.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: Colors.green[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Items in Cart:",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          height: 30,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: cartController.cartItems.length,
                            itemBuilder: (context, index) {
                              final item = cartController.cartItems[index];
                              return Container(
                                margin: EdgeInsets.only(right: 8),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  "${item.name} (${item.quantity})",
                                  style: TextStyle(fontSize: 12),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to cart page
                      Get.to(() => ServiceSummaryPage());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 109, 42, 216),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      "View Cart",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
