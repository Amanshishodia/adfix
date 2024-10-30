// lib/pages/save_address_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../AddressController.dart';

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
                    _buildSaveButton(),
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

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: addressController.isLoading.value
            ? null
            : () => addressController.saveAddress(),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text('Save Address'),
      ),
    );
  }
}
