import 'package:adfix/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerRatingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // No Ratings Section
              Container(
                width: double.infinity,
                color: Colors.grey[200],
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('You currently have no ratings', style: headingH4),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 52.0,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 26.0),

              // Introducing Customer Ratings Section
              Text('Introducing customer ratings', style: headingfade),
              SizedBox(height: 10.0),
              Text(
                  'Just like you rate AD professionals for the overall quality of the service, they also rate you on a scale of 1 to 5. Your aggregate rating is calculated after you have received ratings in at least 3 services.',
                  style: bodysmall400),
              SizedBox(height: 24.0),

              // How Can I Be a 5-Star Customer Section
              Text('How can I be a 5-star customer?', style: headingfade),
              SizedBox(height: 10.0),
              Text(
                  'Did you know that nearly 80% of AD customers are 5-star rated? If you also want that coveted rating, here are a few kind gestures.',
                  style: bodysmall400),
              SizedBox(height: 16.0),

              // Empathize
              Column(
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Icon(Icons.handshake,
                            size: 40, color: Colors.blue), // Placeholder icon
                      ),
                      SizedBox(height: 12.0),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('Empathise', style: headingfade),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                          'Show them you care by offering water; it\'ll help raise their spirit and energy levels.',
                          style: bodysmall400),
                    ],
                  ),
                  SizedBox(height: 16.0),

                  // Support
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Icon(Icons.support_agent,
                            size: 40, color: Colors.red), // Placeholder icon
                      ),
                      SizedBox(height: 12.0),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('Support', style: headingfade),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                          'Provide access to the washroom (if required): they might have been on the go for a while!',
                          style: bodysmall400),
                    ],
                  ),
                  SizedBox(height: 16.0),

                  // Respect
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Icon(Icons.message_outlined,
                            size: 40, color: Colors.green), // Placeholder icon
                      ),
                      SizedBox(height: 12.0),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('Respect', style: headingfade),
                      ),
                      SizedBox(height: 4.0),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                            'Treat professionals the way you’d expect to be treated.',
                            style: bodysmall400),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24.0),

              // How is Customer Rating Calculated Section
              Text('How is customer rating calculated?', style: headingH5),
              SizedBox(height: 8.0),
              Text(
                  'Your aggregate rating is a simple average of all the ratings you’ve received from AD professionals in the past. These individual ratings are anonymous, and so won’t be visible to you or the professional.',
                  style: bodysmall400),
            ],
          ),
        ),
      ),
    );
  }
}
