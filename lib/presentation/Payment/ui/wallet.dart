import 'package:adfix/constants/constant.dart';
import 'package:flutter/material.dart';

class MyWalletPage extends StatefulWidget {
  @override
  State<MyWalletPage> createState() => _MyWalletPageState();
}

class _MyWalletPageState extends State<MyWalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Add back button functionality here
          },
        ),
        title: Text(
          "My Wallet",
          style: headingH4,
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Banner Image
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Refer your', style: headingH4white),
                        SizedBox(height: 5),
                        Text('friends and earn', style: headingH4white),
                      ],
                    ),
                    SizedBox(width: 10),
                    Image.asset(
                      'assets/images/friend.png',
                      scale: 3,
                    )
                  ],
                ),
              ),
            ),
          ),

          // Card with Image and Texts
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Icon Image
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.account_balance_wallet,
                              color: Colors.black),
                        ),
                        SizedBox(width: 12),
                        // Title and Amount Row
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Ad Cash", style: headingH5),
                              Text(
                                  "Formerly Ad Credits. Applicable on all services",
                                  style: bodysmall),
                            ],
                          ),
                        ),
                        Text("₹ 0", style: headingH5),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Texts Below the Row
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Have a question?", style: bodyBigbold),
                Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Wallet activity", style: bodyBigbold),
                // Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
