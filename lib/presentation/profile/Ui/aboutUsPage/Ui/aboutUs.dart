import 'package:adfix/constants/constant.dart';
import 'package:adfix/presentation/profile/Ui/aboutUsPage/Ui/aboutAdfix.dart';
import 'package:adfix/presentation/profile/Ui/helpPage/ui/account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Getting started with Adfix', style: headingH4),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Text('About us', style: headingH5),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: Text('what is Adfix Company?', style: bodyBig),
                      trailing: Icon(Icons.arrow_forward_ios, size: 14),
                      onTap: () {
                        Get.to(AboutAdfix());
                        // Navigate to Account page
                      },
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                      child: Text('Bookings', style: headingH5),
                    ),
                    ListTile(
                      title: Text('How to place a booking ', style: bodyBig),
                      trailing: Icon(Icons.arrow_forward_ios, size: 14),
                      onTap: () {
                        // Navigate to Getting Started page
                      },
                    ),
                    ListTile(
                      title: Text(
                          'Can I re-book the same professional if I like their serice?',
                          style: bodyBig),
                      trailing: Icon(Icons.arrow_forward_ios, size: 14),
                      onTap: () {
                        // Navigate to Payment page
                      },
                    ),
                    ListTile(
                      title: Text('How to book my preferred professional?',
                          style: bodyBig),
                      trailing: Icon(Icons.arrow_forward_ios, size: 14),
                      onTap: () {
                        // Navigate to Membership page
                      },
                    ),
                    ListTile(
                      title: Text(
                          'Do I have to order a minimum value of services before I can place the booking?  ',
                          style: bodyBig),
                      trailing: Icon(Icons.arrow_forward_ios, size: 14),
                      onTap: () {
                        // Navigate to Safety page
                      },
                    ),
                    ListTile(
                      title: Text(
                          'Does Adfix Company charge any cancellation fee?',
                          style: bodyBig),
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
