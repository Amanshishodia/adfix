import 'package:adfix/presentation/auth/ui/sign_up/create_password.dart';
import 'package:adfix/utils/appcolor.dart';
import 'package:adfix/widgets/CustomButton.dart';
import 'package:adfix/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../sign_in/sign_in.dart';

class Createnewpassword extends StatelessWidget {
  const Createnewpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 65),
              child: Image.asset('assets/images/newpassword.png')),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30),
            child: Text(
              'New Password',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Container(
              child: Column(
                children: [
                  CustomTextfield(label: "New Password"),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextfield(label: "New Password"),
                  SizedBox(
                    height: 30,
                  ),
                  Custombutton(
                    onTap: () {
                      Get.to(CreatePassword());
                    },
                    buttonText: "Continue",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(SignIn());
                    },
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Joined us before? ",
                            style: TextStyle(
                                color: AppColor.greytextColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600)),
                        TextSpan(
                            text: " Login ",
                            style: TextStyle(
                                color: AppColor.bluetextColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600))
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
