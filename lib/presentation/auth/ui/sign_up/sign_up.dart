import 'package:adfix/widgets/CustomButton.dart';
import 'package:adfix/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/AuthController.dart'; // Import the controller

class SignUp extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => _authController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 65),
                      child: Image.asset('assets/images/sign_up.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 30),
                      child: Text(
                        'Sign up',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Column(
                        children: [
                          CustomTextfield(
                            controller: _nameController,
                            label: "Name",
                          ),
                          const SizedBox(height: 20),
                          CustomTextfield(
                            controller: _emailController,
                            label: "Email",
                          ),
                          const SizedBox(height: 20),
                          CustomTextfield(
                            controller: _mobileController,
                            label: "Mobile",
                          ),
                          const SizedBox(height: 20),
                          CustomTextfield(
                            controller: _passwordController,
                            label: "Password",
                            obscure: true, // Hides the password
                          ),
                          const SizedBox(height: 20),
                          CustomTextfield(
                            controller: _confirmPasswordController,
                            label: "Confirm Password",
                            obscure: true, // Hides the confirm password
                          ),
                          const SizedBox(height: 30),
                          Custombutton(
                            onTap: () {
                              // Optional validation
                              if (_passwordController.text !=
                                  _confirmPasswordController.text) {
                                Get.snackbar(
                                  "Error",
                                  "Passwords do not match",
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                );
                                return;
                              }

                              _authController.registerUser(
                                _nameController.text.trim(),
                                _emailController.text.trim(),
                                _mobileController.text.trim(),
                                _passwordController.text,
                                _confirmPasswordController.text,
                              );
                            },
                            buttonText: "Register",
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
      ),
    );
  }
}
