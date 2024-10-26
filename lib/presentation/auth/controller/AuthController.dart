import 'dart:convert';

import 'package:adfix/presentation/auth/ui/sign_in/sign_in.dart';
import 'package:adfix/presentation/bottomNav/ui/myHome.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  var isLoading = false.obs;

  Future<void> registerUser(String name, String email, String mobile,
      String password, String confirmPassword) async {
    isLoading(true);
    try {
      var url = Uri.parse('https://ankitadfixapi.onrender.com/register');
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "name": name,
          "email": email,
          "mobile": mobile,
          "password": password,
          "confirmpassword": confirmPassword,
        }),
      );

      if (response.statusCode == 201) {
        var data = json.decode(response.body);
        // Handle success
        Get.snackbar('Success', 'User registered successfully');
        Get.to(SignIn());
      } else {
        print(response.statusCode);
        print(response.body);

        // Handle error
        Get.snackbar('Error', 'Failed to register user');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading(false);
    }
  }

  Future<void> loginUser(String email, String password) async {
    isLoading(true);
    try {
      var url = Uri.parse('https://ankitadfixapi.onrender.com/veryfyLogin');
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        // Assuming 'data' contains a token or user information
        Get.snackbar('Success', 'User logged in successfully');
        Get.to(Myhome());
      } else {
        print(response.statusCode);
        print(response.body);
        // Handle error
        Get.snackbar('Error', 'Failed to log in');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading(false);
    }
  }
}
