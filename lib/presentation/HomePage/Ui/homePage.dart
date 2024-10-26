import 'package:adfix/presentation/HomePage/widget/applienceRepairItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX

import '../../DetailPage/ui/DetailPage.dart';
import '../widget/CustomCard.dart';
import '../widget/CustomTwoCard.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  final List<Map<String, String>> _cardData = const [
    {
      'image': 'assets/images/ac.png',
      'text': 'AC Repair & \nService',
      'type': 'Ac Repair'
    },
    {
      'image': 'assets/images/fridge.png',
      'text': 'Refrigerator \nRepair',
      'type': 'refrigerator'
    },
    {
      'image': 'assets/images/waterpurifier.png',
      'text': 'Water Purifier \nRepair',
      'type': 'vacuum_cleaner'
    },
    {
      'image': 'assets/images/washingmachine.png',
      'text': 'Washing Machine \nRepair',
      'type': 'washing_machine'
    },
    {
      'image': 'assets/images/geyser.png',
      'text': 'Geyser Repair & Service',
      'type': 'microwave'
    },
    {'image': 'assets/images/tv.png', 'text': 'Led TV Repair', 'type': 'tv'},
  ];

  final List<Map<String, String>> _twoCards = const [
    {
      'image': 'assets/images/chimney.png',
      'text': 'Chimney Repair & \nService',
      'type': 'chimney'
    },
    {
      'image': 'assets/images/vaccum.png',
      'text': 'Vacuum Cleaner Repair & \nService',
      'type': 'chimney'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/top.png',
                  width: MediaQuery.of(context).size.width,
                  height: 28,
                ),
                const Text(
                  'Save 10% on every service at just 249',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Block A',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Industrial Area Sector 62",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.person),
                  ),
                ],
              ),
            ),
            Container(
              height: 483,
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: _cardData.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Using Get.to() for navigation
                          Get.to(
                            () => DetailsPage(
                              itemType: _cardData[index]['type']!,
                              image: _cardData[index]['image']!,
                            ),
                          );
                        },
                        child: CustomCard(
                          image: _cardData[index]['image']!,
                          text: _cardData[index]['text']!,
                        ),
                      );
                    },
                  ),
                  // Bottom Grid Section with two cards
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0.0,
                      mainAxisSpacing: 8.0,
                      //
                    ),
                    itemCount: _twoCards.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Using Get.to() for navigation
                          Get.to(
                            () => DetailsPage(
                              itemType: _twoCards[index]['type']!,
                              image: _twoCards[index]['image']!,
                            ),
                          );
                        },
                        child: CustomTwoCard(
                          image: _twoCards[index]['image']!,
                          text: _twoCards[index]['text']!,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Home Image without extra padding
            Container(
              child: Image.asset(
                width: MediaQuery.of(context).size.width,
                'assets/images/home_image.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Vacuum Cleaner Repair & Service',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            // Eachitemlisttile(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Ac Repair & Service',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            // Eachitemlisttile(),
            // Eachitemlisttile(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'AC & Appliance Repair ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Appliencerepairitem(),
                  Appliencerepairitem(),
                  Appliencerepairitem(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
