import 'package:flutter/material.dart';

class PaymentOption {
  final String path;
  final String text;

  PaymentOption({
    required this.path,
    required this.text,
  });
}

class PaymentSection extends StatelessWidget {
  final String title;
  final List<PaymentOption> options;

  PaymentSection({
    required this.title,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...options
            .map(
              (option) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Image.asset(
                      option.path,
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(width: 16),
                    Text(
                      option.text,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ],
    );
  }
}

class PaymentPage extends StatelessWidget {
  final double amount;

  PaymentPage({required this.amount});

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
              'Amount to pay ₹$amount',
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
