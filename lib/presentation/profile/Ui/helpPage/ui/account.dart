import 'package:adfix/constants/constant.dart';
import 'package:adfix/presentation/Payment/ui/savedPaymentDetails.dart';
import 'package:adfix/presentation/auth/ui/changeEmailAddress/ui/changeEmailAddress.dart';
import 'package:adfix/presentation/auth/ui/changePhoneNo/changePhone.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 24),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text('Account', style: headingH4),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    title: Text(
                      'I want to change my phone number',
                      style: bodyBig,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Get.to(ChangePhoneNumberPage());
                      // Navigate to Getting Started page
                    },
                  ),
                  Divider(height: 1),
                  ListTile(
                    title: Text(
                      'Where can I check my saved addresses?',
                      style: bodyBig,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Get.to(SavedPaymentDetails());
                      // Navigate to Payment page
                    },
                  ),
                  Divider(height: 1),
                  ListTile(
                    title: Text(
                      'I want to change my email address',
                      style: bodyBig,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Get.to(ChangeEmailAddressPage());
                      // Navigate to Membership page
                    },
                  ),
                  Divider(height: 1),
                  ListTile(
                    title: Text(
                      'Where can I see my saved payment details?',
                      style: bodyBig,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  Divider(height: 1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
