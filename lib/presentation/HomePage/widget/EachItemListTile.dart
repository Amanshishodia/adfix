import 'dart:ui';

import 'package:adfix/presentation/DetailPage/model/ServiceResponseModel.dart';
import 'package:adfix/presentation/HomePage/widget/serviceFeatures.dart';
// Import the ServiceController
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/CartController.dart'; // Import GetX

class EachItemListTile extends StatefulWidget {
  final Services service; // Accept the Service model

  const EachItemListTile({super.key, required this.service});

  @override
  _EachItemListTileState createState() => _EachItemListTileState();
}

class _EachItemListTileState extends State<EachItemListTile> {
  int _quantity = 0; // This keeps track of the quantity for each service
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 4.0,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.service.serviceName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                        '⭐ ${widget.service.rating} (${widget.service.reviews})'),
                    SizedBox(height: 4),
                    RichText(
                      text: TextSpan(
                        text: '₹ ${widget.service.serviceCharge} ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Time: 35 mins',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'View Details',
                      style: TextStyle(color: Colors.red, fontSize: 8),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        widget.service.image.url,
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: -10,
                      child: _quantity == 0
                          ? ElevatedButton(
                              onPressed: () {
                                _openDrawer(context);
                              },
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.black12,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                backgroundColor: Colors.white,
                              ),
                              child: Text(
                                "Add",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                              ),
                            )
                          : _buildQuantityController(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to show the drawer
  void _openDrawer(BuildContext context) {
    _showServiceDetails(context, widget.service);
  }

  // Method to close the drawer and show quantity controller
  void _closeDrawerAndShowQuantityController() {
    CartItem cartItem = CartItem(
      id: widget.service.id ?? DateTime.now().toString(),
      // Fallback if id is null
      name: widget.service.serviceName,
      price: double.parse(widget.service.serviceCharge.toString()),
      imageUrl: widget.service.image.url,
      quantity: 1,
    );

    // Add to cart
    cartController.addItem(cartItem);

    // Close the drawer
    Navigator.of(context).pop();

    // Update state
    setState(() {
      _quantity = 1;
    });
  }

  // Build the quantity controller widget
  Widget _buildQuantityController() {
    return Obx(() {
      final cartItem = cartController.cartItems.firstWhere(
        (item) => item.id == (widget.service.id ?? ''),
        orElse: () => CartItem(
          id: widget.service.id ?? DateTime.now().toString(),
          name: widget.service.serviceName,
          price: double.parse(widget.service.serviceCharge.toString()),
          imageUrl: widget.service.image.url,
          quantity: 0,
        ),
      );

      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 2),
              blurRadius: 4.0,
            ),
          ],
        ),
        width: 87,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.remove, size: 12),
              onPressed: () {
                cartController.decrementQuantity(widget.service.id ?? '');
                if (cartItem.quantity.value == 0) {
                  setState(() {
                    _quantity = 0;
                  });
                }
              },
            ),
            Text(
              '${cartItem.quantity}',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.add, size: 12),
              onPressed: () {
                cartController.incrementQuantity(widget.service.id ?? '');
              },
            ),
          ],
        ),
      );
    });
  }

  void _showServiceDetails(BuildContext context, Services service) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(color: Colors.black.withOpacity(0.5)),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.8,
              maxChildSize: 0.85,
              minChildSize: 0.7,
              builder: (_, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 25),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Service details section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              service.serviceName,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Close the drawer and show quantity controller
                                _closeDrawerAndShowQuantityController();
                              },
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.black12,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(color: Colors.green[400]!),
                                ),
                                backgroundColor: Colors.white,
                              ),
                              child: Text(
                                "Add",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text('⭐ ${service.rating} (${service.reviews})'),
                        SizedBox(height: 4),
                        RichText(
                          text: TextSpan(
                            text: '₹ ${service.serviceCharge} ',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: 'Time: 35 mins',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 35),
                        Text(
                          "About the service",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 9),
                        ServiceFeatures(
                            text: 'Advanced Foam-jet cleaning of indoor unit'),
                        SizedBox(height: 9),
                        ServiceFeatures(
                            text: 'Advanced Foam-jet cleaning of indoor unit'),
                        SizedBox(height: 9),
                        ServiceFeatures(
                            text: 'Advanced Foam-jet cleaning of indoor unit'),
                        SizedBox(height: 35),
                        Text(
                          "About the service",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: List.generate(4, (index) {
                                return Column(
                                  children: [
                                    // Numbered Circle
                                    CircleAvatar(
                                      radius: 12,
                                      backgroundColor: Colors.grey,
                                      child: Text(
                                        '${index + 1}',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                  ],
                                );
                              }),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "AC Cleaning",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Includes cleaning of filters and AC cooling coils.",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
