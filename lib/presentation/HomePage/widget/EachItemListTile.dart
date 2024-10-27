import 'dart:ui';
import 'package:adfix/presentation/DetailPage/model/ServiceResponseModel.dart';
import 'package:adfix/presentation/HomePage/widget/serviceCheck.dart';
import 'package:adfix/presentation/HomePage/widget/serviceFeatures.dart';
import 'package:flutter/material.dart';

class Eachitemlisttile extends StatefulWidget {
  final Services service; // Accept the Service model

  const Eachitemlisttile({super.key, required this.service});

  @override
  _EachitemlisttileState createState() => _EachitemlisttileState();
}

class _EachitemlisttileState extends State<Eachitemlisttile> {
  int _quantity = 0; // This keeps track of the quantity for each service

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
    Navigator.of(context).pop();
    setState(() {
      _quantity = 1;
    });
  }

  // Build the quantity controller widget
  Widget _buildQuantityController() {
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
              setState(() {
                if (_quantity > 1) {
                  _quantity--;
                } else {
                  _quantity = 0; // Reset to "Add" button if quantity < 1
                }
              });
            },
          ),
          Text(
            '$_quantity',
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(Icons.add, size: 12),
            onPressed: () {
              setState(() {
                _quantity++;
              });
            },
          ),
        ],
      ),
    );
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
                                // Navigator.of(context).pop();
                                _closeDrawerAndShowQuantityController();
                                // Navigator.pop(context);
                                // _showServiceDetails(context, service);
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
                        //  SizedBox(height: 35),
                        Text(
                          "About the service",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 9),
                        ServiceFeatures(
                            text: 'Advnced Foam-jet cleaning of indoor unit'),
                        SizedBox(height: 9),
                        ServiceFeatures(
                            text: 'Advnced Foam-jet cleaning of indoor unit'),
                        SizedBox(height: 9),
                        ServiceFeatures(
                            text: 'Advnced Foam-jet cleaning of indoor unit'),
                        SizedBox(height: 35),

                        Text(
                          "About the service",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // SizedBox(height: 9),
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
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    if (index < 3) // Vertical line
                                      Container(
                                        width: 2,
                                        height: 85,
                                        color: Colors.grey,
                                      ),
                                  ],
                                );
                              }),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(height: 35),
                                  ServiceCheck(
                                    heading: 'Pre-service checks',
                                    Subheading:
                                        'Detailed inspection including gas check to identify repairs',
                                  ),
                                  SizedBox(height: 18),
                                  ServiceCheck(
                                    heading: 'Foam-jet cleaning',
                                    Subheading:
                                        'Advanced cleaning of the indoor unit',
                                  ),
                                  SizedBox(height: 18),
                                  ServiceCheck(
                                    heading: 'Post-service checks',
                                    Subheading:
                                        'Final check to ensure everything is working fine',
                                  ),
                                  SizedBox(height: 18),
                                  ServiceCheck(
                                    heading: 'Feedback and cleanup',
                                    Subheading:
                                        'Collect feedback and clean the service area',
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
