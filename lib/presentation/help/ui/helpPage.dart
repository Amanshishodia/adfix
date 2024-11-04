import 'package:flutter/material.dart';

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
          title: Text(
            'How can we help you?',
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: Text('Account'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 14),
                      onTap: () {
                        // Navigate to Account page
                      },
                    ),
                    ListTile(
                      title: Text('Getting started with Adfix'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 14),
                      onTap: () {
                        // Navigate to Getting Started page
                      },
                    ),
                    ListTile(
                      title: Text('Payment & Adfix Credits'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 14),
                      onTap: () {
                        // Navigate to Payment page
                      },
                    ),
                    ListTile(
                      title: Text('AD Plus Membership'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 14),
                      onTap: () {
                        // Navigate to Membership page
                      },
                    ),
                    ListTile(
                      title: Text('Adfix Safety'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 14),
                      onTap: () {
                        // Navigate to Safety page
                      },
                    ),
                    ListTile(
                      title: Text('Warranty'),
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
