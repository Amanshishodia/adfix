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
                    "Congratulations ! 100 saved so far",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(width: 8),
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
                            "₹ ${cartController.total.value.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ]),
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
