import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../DetailPage/model/ServiceResponseModel.dart';

class BottomNavBarController extends GetxController {
  var isLoadingFirst = false.obs;
  var isLoadingSecond = false.obs;
  var firstServiceList = <Services>[].obs;
  var secondServiceList = <Services>[].obs;
  var selectedIndex = 0.obs;

  final String baseUrl = 'https://ankitadfixapi.onrender.com/displayservices';

  @override
  void onInit() {
    super.onInit();
    fetchFirstServices();
    fetchSecondServices();
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  // Fetch services for first category (AC Repair)
  Future<void> fetchFirstServices() async {
    try {
      isLoadingFirst(true);

      // Now using GET request to fetch services based on the category
      final response = await http.get(
        Uri.parse('$baseUrl?Category=Ac%20Repair'),
        // Send Category as a query parameter
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        if (data.containsKey('services') && data['services'] is List) {
          final List<dynamic> servicesJson = data['services'];
          final List<Services> services = servicesJson
              .map((serviceJson) => Services.fromJson(serviceJson))
              .toList();

          firstServiceList.assignAll(services);
        } else {
          print('Invalid data format for first services');
        }
      } else {
        print('Failed to fetch first services: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching first services: $e');
    } finally {
      isLoadingFirst(false);
    }
  }

  // Fetch services for second category (Vacuum Cleaner)
  Future<void> fetchSecondServices() async {
    try {
      isLoadingSecond(true);

      // Now using GET request to fetch services based on the category
      final response = await http.get(
        Uri.parse('$baseUrl?Category=Vacuum%20Cleaner'),
        // Send Category as a query parameter
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        if (data.containsKey('services') && data['services'] is List) {
          final List<dynamic> servicesJson = data['services'];
          final List<Services> services = servicesJson
              .map((serviceJson) => Services.fromJson(serviceJson))
              .toList();

          secondServiceList.assignAll(services);
        } else {
          print('Invalid data format for second services');
        }
      } else {
        print('Failed to fetch second services: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching second services: $e');
    } finally {
      isLoadingSecond(false);
    }
  }

  // Helper method to handle API errors
  void handleError(String message) {
    // You can implement custom error handling here
    print('Error: $message');
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
