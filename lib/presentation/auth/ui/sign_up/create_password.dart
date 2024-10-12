import 'package:adfix/presentation/auth/ui/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/appcolor.dart';
import '../../../../widgets/CustomButton.dart';
import '../../../../widgets/textfield.dart';

class CreatePassword extends StatelessWidget {
  const CreatePassword({super.key});

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
              child: Image.asset('assets/images/sign_up.png')),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Create Password',
                      style: TextStyle(fontWeight: FontWeight.w900)),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextfield(label: "Mobile Number / Email"),
                  SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: Custombutton(
                      buttonText: "Submit",
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: InkWell(
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
