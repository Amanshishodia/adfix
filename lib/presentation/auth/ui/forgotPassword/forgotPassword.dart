import 'package:adfix/presentation/auth/ui/forgotOtp/forgot_otp.dart';
import 'package:adfix/widgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/textfield.dart';

class Forgotpassword extends StatelessWidget {
  const Forgotpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset('assets/images/forgot.png')),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 40, bottom: 20),
              child: Text(
                'Forgot Password',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 34),
                child: CustomTextfield(label: "Mobile Number / Email"),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Custombutton(
                onTap: () {
                  Get.to(ForgotOtp());
                },
                buttonText: "Submit",
              ),
            )
          ],
        ),
      ),
    );
  }
}
