import 'package:adfix/constants/constant.dart';
import 'package:adfix/presentation/auth/ui/changePhoneNo/detailPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePhoneNumberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("I want to change my phone number", style: headingH4),
            SizedBox(height: 8),
            Text(
                "You can change your phone number from the profile section after verifying it with an OTP",
                style: bodyBig),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Get.to(EditProfilePage());
              },
              child: Text("Change phone number", style: headingH4white),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text("Was this article helpful?", style: bodyBig),
                Spacer(),
                IconButton(
                  icon:
                      Icon(Icons.thumb_up_alt_outlined, color: Colors.black54),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.thumb_down_alt_outlined,
                      color: Colors.black54),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
