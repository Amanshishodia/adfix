import 'package:flutter/material.dart';



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
          onPressed: () {
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "I want to change my phone number",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),

            Text(
              "You can change your phone number from the profile section after verifying it with an OTP",
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
              },
              child: Text(
              "Change phone number",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              ),
            ),
            SizedBox(height: 20,),

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
                  icon: Icon(Icons.thumb_up_alt_outlined, color: Colors.black54),
                  onPressed: () {

                  },
                ),
                IconButton(
                  icon: Icon(Icons.thumb_down_alt_outlined, color: Colors.black54),
                  onPressed: () {
                  },
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