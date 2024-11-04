import 'dart:convert';

import 'package:adfix/presentation/HomePage/Ui/homePage.dart';
import 'package:adfix/presentation/auth/ui/sign_in/sign_in.dart';
import 'package:adfix/presentation/bottomNav/ui/myHome.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  var isLoading = false.obs;
  var isLoggedIn = false.obs;
  var isInitialized = false.obs;
  final storage = GetStorage();

  // Called when controller is initialized
  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  Future<void> initializeAuth() async {
    // Add a small delay to show splash screen
    await Future.delayed(Duration(milliseconds: 500));
    await checkLoginStatus();
    isInitialized(true);
  }

  // Register User
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
        Get.snackbar('Success', 'User registered successfully');

        Get.to(SignIn());
      } else {
        Get.snackbar('Error', 'Failed to register user');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading(false);
    }
  }

  // Login User
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

        // Store user data and token
        await _saveUserData(data);

        Get.snackbar('Success', 'User logged in successfully');
        Get.offAll(() => Myhome());
      } else {
        Get.snackbar('Error', 'Failed to log in');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading(false);
    }
  }

  // Check login status
  Future<void> checkLoginStatus() async {
    // Get token from storage
    final token = storage.read('token');

    if (token != null) {
      // Verify token validity here if needed
      isLoggedIn(true);
      Get.offAll(() => Myhome());
    } else {
      isLoggedIn(false);
      Get.offAll(() => Homepage());
    }
  }

  // Save user data and token
  Future<void> _saveUserData(Map<String, dynamic> data) async {
    // Store the token
    await storage.write('token', data['token']);

    // Store user data
    await storage.write('userData', data['user']);

    // Update login state
    isLoggedIn(true);
  }

  // Logout User
  Future<void> logoutUser() async {
    // Clear all stored data
    await storage.erase();

    // Update login state
    isLoggedIn(false);

    // Navigate to login
    Get.offAll(() => SignIn());
  }

  // Get stored user data
  Map<String, dynamic>? getUserData() {
    return storage.read('userData');
  }
}
