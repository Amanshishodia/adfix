import 'package:adfix/constants/constant.dart';
import 'package:adfix/presentation/changeAddress/Ui/changeAddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageAddressesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Manage Addresses',
          style: headingH4,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: Colors.grey[300]),
            Container(
              child: TextButton.icon(
                onPressed: () {
                  Get.to(SaveAddressPage());
                },
                icon: Icon(Icons.add, color: Colors.green[500]),
                label: Text(
                  'Add another address',
                  style: TextStyle(color: Colors.green, fontSize: 16.0),
                ),
              ),
            ),
            Divider(color: Colors.grey[300]),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Home', style: headingH5),
                      PopupMenuButton<String>(
                        icon: Icon(Icons.more_vert, color: Colors.black),
                        color: Colors.white,
                        onSelected: (String value) {
                          // Handle Edit/Delete actions here
                          if (value == 'Edit') {
                            // Navigate to edit address page
                          } else if (value == 'Delete') {
                            // Show delete confirmation dialog
                          }
                        },
                        itemBuilder: (BuildContext context) => [
                          PopupMenuItem<String>(
                            value: 'Edit',
                            child: Text(
                              'Edit',
                              style: bodyBig,
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'Delete',
                            child: Text(
                              'Delete',
                              style: bodyBig,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 0.0),
                  Text(
                      'Block A, Industrial Area, Sector 62, Noida,\nUttar Pradesh 201309, India',
                      style: bodysmall400),
                  SizedBox(height: 8.0),
                  Text('Somya, +91 8081942194', style: bodysmall400),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
