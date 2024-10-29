import 'package:adfix/presentation/Payment/widgets/paymentSection.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select payment method',
                style: TextStyle(color: Colors.black)),
            Text(
              'Amount to pay ₹1,187',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(),
              PaymentSection(title: 'Cards', options: [
                PaymentOption(
                    path: 'assets/images/criditCard.png', text: 'Add new card'),
              ]),
              Divider(),
              PaymentSection(title: 'UPI', options: [
                PaymentOption(
                    path: 'assets/images/GooglePay.png',
                    text: 'Google Pay UPI'),
                PaymentOption(
                    path: 'assets/images/phonePay.png', text: 'PhonePe UPI'),
                PaymentOption(
                    path: 'assets/images/icici.png', text: 'iMobile Pay UPI'),
                PaymentOption(
                    path: 'assets/images/Upi.png', text: 'Add a new UPI ID'),
              ]),
              Divider(),
              PaymentSection(title: 'Wallet', options: [
                PaymentOption(
                    path: 'assets/images/criditCard.png', text: 'Wallet'),
              ]),
              Divider(),
              PaymentSection(title: 'Pay after service', options: [
                PaymentOption(
                    path: 'assets/images/cash.png',
                    text: 'Pay online after service'),
                PaymentOption(
                    path: 'assets/images/Money.png',
                    text: 'Pay with cash after service'),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
