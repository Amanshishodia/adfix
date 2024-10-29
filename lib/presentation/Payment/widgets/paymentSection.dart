import 'package:flutter/material.dart';

class PaymentSection extends StatelessWidget {
  final String title;
  final List<PaymentOption> options;

  PaymentSection({required this.title, required this.options});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Column(
          children: options
              .map((option) => ListTile(
                    leading: Image.asset(
                      option.path,
                      scale: 2.5,
                    ),
                    title: Text(option.text),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Handle option selection here
                    },
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class PaymentOption {
  final String path;
  final String text;

  PaymentOption({required this.path, required this.text});
}
