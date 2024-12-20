import 'package:adfix/constants/constant.dart';
import 'package:flutter/material.dart';

class AboutAdfix extends StatelessWidget {
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
            Text("What is Adfix company?", style: headingH4),
            SizedBox(height: 8),
            Text(
                "Adfix company (formerly Adfix) is Asia's largest online home services  marketplace.it was started in 2020 by Abhiraj Singh Bhal, Varun Khaitan and Raghav Chandra.",
                style: bodyBig),
            SizedBox(height: 8),
            Text(
                "We currently operate in multiple cities in india, Singapore,Saudi Arabia and UAE.",
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
