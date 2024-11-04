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
              child: Text(
                'Account',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    title: Text('I want to change my phone number'),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Get.to(ChangePhoneNumberPage());
                      // Navigate to Getting Started page
                    },
                  ),
                  Divider(height: 1),
                  ListTile(
                    title: Text('I want to change my phone number'),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Navigate to Payment page
                    },
                  ),
                  Divider(height: 1),
                  ListTile(
                    title: Text('I want to change my phone number'),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Navigate to Membership page
                    },
                  ),
                  Divider(height: 1),
                  ListTile(
                    title: Text('I want to change my phone number'),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Navigate to Safety page
                    },
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
