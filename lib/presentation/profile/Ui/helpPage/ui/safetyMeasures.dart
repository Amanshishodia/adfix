import 'package:adfix/constants/constant.dart';
import 'package:flutter/material.dart';

class SafetyMeasures extends StatelessWidget {
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
            Text("Know more about Urban Company's safety measures",
                style: headingH4),
            SizedBox(height: 15),
            Text(
                "At Adfix Company, the safety of teh customer and professinals is taken extremely seriously. To ensure this, we have taken the following precautionary measures:",
                style: bodyBig),
            SizedBox(height: 15),
            Text("We conduct background verification on all our professionals ",
                style: bodyBig),
            SizedBox(height: 10),
            Text(
                "In case of any critical support, SOS button is availble in app for both our customers and professionals",
                style: bodyBig),
            SizedBox(height: 20),
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
