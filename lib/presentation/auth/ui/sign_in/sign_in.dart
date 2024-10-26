import 'package:adfix/presentation/auth/controller/AuthController.dart';
import 'package:adfix/presentation/auth/ui/forgotPassword/forgotPassword.dart';
import 'package:adfix/presentation/auth/ui/sign_up/sign_up.dart';
import 'package:adfix/presentation/auth/widgets/IconButton.dart';
import 'package:adfix/utils/appcolor.dart';
import 'package:adfix/widgets/CustomButton.dart';
import 'package:adfix/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  // Create text editing controllers for email and password fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Use Get.put to initialize and retrieve the AuthController
    AuthController authController = Get.put(AuthController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 82, top: 38),
              child: Image.asset("assets/images/sign_in.png"),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: Text(
                'Login',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 34),
                child: CustomTextfield(
                  controller: emailController, // Set the controller
                  label: "Enter Your Email",
                ),
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 34),
                child: CustomTextfield(
                  controller: passwordController, // Set the controller
                  label: "Password",
                  obscure: true, // Hide the password
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 205),
              child: TextButton(
                onPressed: () {
                  Get.to(Forgotpassword());
                },
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                      color: AppColor.buttontextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Bind the loading state to show loading when logging in
            Obx(() {
              return Center(
                child: authController.isLoading.value
                    ? CircularProgressIndicator() // Show loading indicator if logging in
                    : Custombutton(
                        buttonText: "Login",
                        onTap: () {
                          // Call the loginUser method when login is tapped
                          authController.loginUser(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                        },
                      ),
              );
            }),
            const SizedBox(height: 20),
            Center(
              child: Image.asset("assets/images/line.png"),
            ),
            CustomIconButton(
              textcolor: const Color(0xff768195),
              backGroundColor: const Color(0xffF1F5F6),
              dothis: () {
                // Add Google login logic if needed
              },
              image: Image.asset(
                'assets/images/google.png',
                height: 24,
                width: 24,
              ),
              name: "Login With Google",
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                Get.to(SignUp());
              },
              child: Center(
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an Account ?",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: " Register Now",
                        style: TextStyle(color: Color(0xff005A00)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
