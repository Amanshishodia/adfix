import 'package:adfix/presentation/auth/ui/forgotPassword/forgotPassword.dart';
import 'package:adfix/presentation/auth/widgets/IconButton.dart';
import 'package:adfix/utils/appcolor.dart';
import 'package:adfix/widgets/CustomButton.dart';
import 'package:adfix/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 82, top: 38),
            child: Image.asset("assets/images/sign_in.png"),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34),
            child: Text(
              'Login',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 34),
              child: CustomTextfield(label: "Mobile Number"),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 34),
              child: CustomTextfield(label: "Password"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 205),
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
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Center(child: Custombutton(buttonText: "Login")),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Image.asset("assets/images/line.png"),
          ),
          CustomIconButton(
              textcolor: Color(0xff768195),
              backGroundColor: Color(0xffF1F5F6),
              dothis: () {},
              image: Image.asset(
                'assets/images/google.png',
                height: 24,
                width: 24,
              ),
              name: "Login With Google"),
          SizedBox(
            height: 10,
          ),
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "Don't have a Account ?",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: " Register Now",
                      style: TextStyle(color: Color(0xff005A00)))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
