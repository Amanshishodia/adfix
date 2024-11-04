import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            
          },
        ),
        title: const Text(
          "Edit profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: "Full Name",
                contentPadding:
                    EdgeInsets.symmetric(vertical: 25.0, horizontal: 0.0),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "Email Address",
                contentPadding:
                    EdgeInsets.symmetric(vertical: 25.0, horizontal: 0.0),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  labelStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.black, 
                  ),
                  alignLabelWithHint: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/flag.jpg', 
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "+91",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black, 
                          ),
                        ),
                      ],
                    ),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey), 
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: CustomButton(
                buttonText: "Update Now",
                onTap: () {
                  _showConfirmationDialog(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "All communications and invoices will be sent to your updated contact details",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "CANCEL",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  CustomButton(
                    buttonText: "CONFIRM",
                    onTap: () {
                      // Handle confirm action
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onTap;

  const CustomButton({Key? key, required this.buttonText, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.green[700],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
