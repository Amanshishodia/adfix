import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/ServiceResponseModel.dart'; // Adjust the import to your actual path

class DetailsController extends GetxController {
  var isLoading = true.obs; // Observable to track loading state
  var itemData =
      Rxn<ServiceResponseModel>(); // Nullable observable to hold parsed data

  // Function to fetch data from an API
  Future<void> fetchData(String itemType) async {
    isLoading.value = true; // Set loading to true at start
    try {
      final response = await http.get(
        Uri.parse(
            'https://ankitadfixapi.onrender.com/displaycategorywise/${itemType}'),
      );

      if (response.statusCode == 200) {
        // Parse the response to the ServiceResponseModel
        itemData.value = serviceResponseModelFromJson(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // Handle errors
      print("Error fetching data: $e");
      // Optionally, handle the error by setting itemData to null or an empty model
      itemData.value = null;
    } finally {
      isLoading.value = false; // Stop the loading spinner
    }
  }
}
