// lib/controller/AddressController.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddressController extends GetxController {
  final storage = GetStorage();
  var isLoading = false.obs;
  var addresses = [].obs;
  var selectedAddressType = "Home".obs;
  var selectedAddress = Rxn<Map<String, dynamic>>();

  // Form controllers
  final TextEditingController houseNumberController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadAddresses();
  }

  @override
  void onClose() {
    houseNumberController.dispose();
    streetController.dispose();
    landmarkController.dispose();
    phoneController.dispose();
    super.onClose();
  }

  Future<void> loadAddresses() async {
    isLoading(true);
    try {
      final savedAddresses = storage.read('addresses') ?? [];
      addresses.value = List<Map<String, dynamic>>.from(savedAddresses);
      // If there's a selected address, try to find it in the loaded addresses
      final savedSelectedAddress = storage.read('selectedAddress');
      if (savedSelectedAddress != null) {
        selectedAddress.value = savedSelectedAddress;
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load addresses: ${e.toString()}',
        backgroundColor: Colors.red[100],
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> saveAddress() async {
    if (!_validateInputs()) {
      Get.snackbar(
        'Error',
        'Please fill all required fields',
        backgroundColor: Colors.red[100],
      );
      return;
    }

    isLoading(true);
    try {
      final newAddress = {
        'type': selectedAddressType.value,
        'houseNumber': houseNumberController.text,
        'street': streetController.text,
        'landmark': landmarkController.text,
        'phone': phoneController.text,
      };

      // Add the new address to the list
      addresses.add(newAddress);

      // Save to local storage
      await storage.write('addresses', addresses.toList());

      // Set as selected address
      selectedAddress.value = newAddress;
      await storage.write('selectedAddress', newAddress);

      _clearInputs();
      Get.snackbar(
        'Success',
        'Address saved successfully',
        backgroundColor: Colors.green[100],
      );
      Get.back();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to save address: ${e.toString()}',
        backgroundColor: Colors.red[100],
      );
    } finally {
      isLoading(false);
    }
  }

  void selectAddress(Map<String, dynamic> address) {
    selectedAddress.value = address;
    storage.write('selectedAddress', address);
  }

  String get formattedSelectedAddress {
    if (selectedAddress.value == null) return 'No address selected';
    final address = selectedAddress.value!;
    return '${address['houseNumber']}, ${address['street']}'
        '${address['landmark']?.isNotEmpty == true ? ', ${address['landmark']}' : ''}'
        ' (${address['type']})';
  }

  bool _validateInputs() {
    return houseNumberController.text.isNotEmpty &&
        streetController.text.isNotEmpty &&
        phoneController.text.isNotEmpty;
  }

  void _clearInputs() {
    houseNumberController.clear();
    streetController.clear();
    landmarkController.clear();
    phoneController.clear();
    selectedAddressType.value = "Home";
  }

  void setAddressType(String type) {
    selectedAddressType.value = type;
  }
}
