// lib/pages/save_address_page.dart
import 'dart:ui';

import 'package:adfix/presentation/summary/ui/SummaryPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/AddressController.dart';
import '../controller/DateandTimeController.dart';

class SaveAddressPage extends StatelessWidget {
  final addressController = Get.put(AddressController());

  SaveAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Address'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() => Stack(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Image.asset('assets/images/googleMap.png'),
                      ),
                    ),
                    _buildAddressTypeSection(),
                    SizedBox(height: 24),
                    _buildAddressForm(),
                    SizedBox(height: 24),
                    _buildSaveButton(context),
                  ],
                ),
              ),
              if (addressController.isLoading.value)
                Container(
                  color: Colors.black.withOpacity(0.3),
                  child: Center(child: CircularProgressIndicator()),
                ),
            ],
          )),
    );
  }

  Widget _buildAddressTypeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Address Type',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            _addressTypeButton('Home'),
            SizedBox(width: 16),
            _addressTypeButton('Work'),
            SizedBox(width: 16),
            _addressTypeButton('Other'),
          ],
        ),
      ],
    );
  }

  Widget _addressTypeButton(String type) {
    return Obx(() => OutlinedButton(
          onPressed: () => addressController.setAddressType(type),
          style: OutlinedButton.styleFrom(
            backgroundColor: addressController.selectedAddressType.value == type
                ? Colors.blue[50]
                : null,
            side: BorderSide(
              color: addressController.selectedAddressType.value == type
                  ? Colors.blue
                  : Colors.grey,
            ),
          ),
          child: Text(type),
        ));
  }

  Widget _buildAddressForm() {
    return Column(
      children: [
        TextField(
          controller: addressController.houseNumberController,
          decoration: InputDecoration(
            labelText: 'House/Flat Number *',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: addressController.streetController,
          decoration: InputDecoration(
            labelText: 'Street/Area *',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: addressController.landmarkController,
          decoration: InputDecoration(
            labelText: 'Landmark (Optional)',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: addressController.phoneController,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: 'Phone Number *',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return Container(
      width: double.infinity,

      // Set your desired color here
      child: ElevatedButton(
        onPressed: addressController.isLoading.value
            ? null
            : () async {
                await addressController.saveAddress();
                _showServiceDetails(context);
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff9263FF),
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text(
          'Save and proceed to slots',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

void _showServiceDetails(BuildContext context) {
  // Initialize the controller
  final dateTimeController = Get.put(DateTimeController());

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: const DateTimeSelectionSection(),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, -2),
                          ),
                        ],
                      ),
                      child: SafeArea(
                        child: Obx(() => TextButton(
                              onPressed:
                                  dateTimeController.selectedDate.value !=
                                              null &&
                                          dateTimeController
                                              .selectedTime.value.isNotEmpty
                                      ? () {
                                          // Handle checkout
                                          Get.to(
                                              ServiceSummaryPage()); // or navigate to checkout
                                        }
                                      : null,
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'Proceed to checkout',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      );
    },
  );
}
