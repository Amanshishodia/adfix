import 'package:adfix/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back(); // Go back to the previous page
            },
          ),
          title: Text('Profile', style: headingH3),
          centerTitle: true,
          elevation: 4.0, // Adds shadow to the bottom
          shape: Border(
            top: BorderSide(color: Colors.grey, width: 1.0),
            bottom: BorderSide(color: Colors.grey, width: 1.0),
          ),
          shadowColor: Colors.black.withOpacity(0.5),
          bottomOpacity: 0.5,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      label: Text(
                    "Name",
                    style: bodyBig,
                  )),
                ),
                TextField(
                  decoration: InputDecoration(
                      label: Text(
                    "Email Address",
                    style: bodyBig,
                  )),
                ),
                TextField(
                  decoration: InputDecoration(
                      label: Text(
                    "Mobile Number",
                    style: bodyBig,
                  )),
                ),
              ],
            ),
          ),
        ));
  }
}
