import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AddressController extends GetxController {
  final storage = GetStorage();
  var isLoading = false.obs;
  var addresses = [].obs;
  var selectedAddressType = "Home".obs;

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
      await fetchAddressesFromServer();
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

  Future<void> fetchAddressesFromServer() async {
    try {
      final token = storage.read('token');
      final response = await http.get(
        Uri.parse('https://ankitadfixapi.onrender.com/addresses'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> serverAddresses = json.decode(response.body);
        addresses.value = serverAddresses.cast<Map<String, dynamic>>();
        await storage.write('addresses', addresses);
      } else {
        throw 'Failed to fetch addresses';
      }
    } catch (e) {
      print('Error fetching addresses: $e');
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

      final token = storage.read('token');
      final response = await http.post(
        Uri.parse('https://ankitadfixapi.onrender.com/addAddress'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: json.encode(newAddress),
      );

      if (response.statusCode == 201) {
        final serverAddress = json.decode(response.body);
        addresses.add(serverAddress);
        await storage.write('addresses', addresses.toList());
        _clearInputs();
        Get.snackbar(
          'Success',
          'Address saved successfully',
          backgroundColor: Colors.green[100],
        );
        Get.back();
      } else {
        throw 'Failed to save address';
      }
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
