import 'package:flutter/material.dart';

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
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
                      Text(
                        'Home',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                     
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
                              child: Text('Edit'),
                            ),
                            PopupMenuItem<String>(
                              value: 'Delete',
                              child: Text('Delete'),
                            ),
                          ],
                        )
                    ],
                  ),
                  SizedBox(height: 8.0),
                
                  Text(
                    'Block A, Industrial Area, Sector 62, Noida,\nUttar Pradesh 201309, India',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 8.0),
                 
                  Text(
                    'Somya, +91 8081942194',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}