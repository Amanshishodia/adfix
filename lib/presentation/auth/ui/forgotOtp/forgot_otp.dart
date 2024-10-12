import 'package:adfix/presentation/auth/ui/createNewPassword/createNewPassword.dart';
import 'package:adfix/widgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/textfield.dart';

class ForgotOtp extends StatelessWidget {
  const ForgotOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset('assets/images/otp.png')),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 40, bottom: 20),
              child: Text(
                'OTP',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 34),
                child: CustomTextfield(label: "OTP"),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Custombutton(
                onTap: () {
                  Get.to(Createnewpassword());
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
