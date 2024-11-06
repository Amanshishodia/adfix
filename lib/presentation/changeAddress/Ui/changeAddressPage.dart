import 'package:adfix/presentation/auth/ui/changePhoneNo/detailPage.dart';
import 'package:adfix/presentation/changeAddress/Ui/manageAddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeAddressPage extends StatelessWidget {
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
            SizedBox(height: 8),
            Text(
              "You can check your saved addresses using the following ways:",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            Text(
              "Where can I check my saved addresses?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              " 1. While selecting the location on the app homescreen",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 8),
            Text(
              " 2. Check address on the checkout screen before making payment",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Check address on the checkout screen before making payment",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            
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
                Get.to(ManageAddressesPage());
              },
              child: Text(
                "My addresses",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Was this article helpful?",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
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
