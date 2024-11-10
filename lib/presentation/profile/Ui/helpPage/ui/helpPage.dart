import 'package:adfix/constants/constant.dart';
import 'package:adfix/presentation/profile/Ui/aboutUsPage/Ui/aboutUs.dart';
import 'package:adfix/presentation/profile/Ui/helpPage/ui/account.dart';
import 'package:adfix/presentation/profile/Ui/helpPage/ui/safetyMeasures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('How can we help you?', style: headingH5),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                child: Text(
                  'All topics',
                  style: headingH5,
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: Text(
                        'Account',
                        style: bodyBig,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, size: 14),
                      onTap: () {
                        Get.to(AccountPage());
                        // Navigate to Account page
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Getting started with Adfix',
                        style: bodyBig,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, size: 14),
                      onTap: () {
                        Get.to(AboutPage());
                        // Navigate to Getting Started page
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Payment & Adfix Credits',
                        style: bodyBig,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, size: 14),
                      onTap: () {
                        // Navigate to Payment page
                      },
                    ),
                    ListTile(
                      title: Text(
                        'AD Plus Membership',
                        style: bodyBig,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, size: 14),
                      onTap: () {
                        // Navigate to Membership page
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Adfix Safety',
                        style: bodyBig,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, size: 14),
                      onTap: () {
                        Get.to(SafetyMeasures());
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Warranty',
                        style: bodyBig,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, size: 14),
                      onTap: () {
                        // Navigate to Warranty page
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
