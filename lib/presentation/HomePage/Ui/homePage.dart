import 'package:adfix/presentation/bottomNav/home_controller/controller.dart';
import 'package:adfix/presentation/summary/ui/SummaryPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/PersistantCartWidget.dart';
import '../../DetailPage/Controller/DetailPageContoller.dart';
import '../../DetailPage/ui/DetailPage.dart';
import '../controller/CartController.dart';
import '../widget/CustomCard.dart';
import '../widget/CustomTwoCard.dart';
import '../widget/EachItemListTile.dart';
import '../widget/applienceRepairItem.dart';

class HomePage extends StatelessWidget {
  final BottomNavBarController apicontroller =
      Get.put(BottomNavBarController());
  final DetailsController controller = Get.put(DetailsController());
  final CartController cartController = Get.put(CartController());

  final List<Map<String, String>> _cardData = [
    {
      'image': 'assets/images/ac.png',
      'text': 'AC Repair & \nService',
      'type': 'Ac Repair'
    },
    {
      'image': 'assets/images/fridge.png',
      'text': 'Refrigerator \nRepair',
      'type': 'Refrigetor Repair'
    },
    {
      'image': 'assets/images/waterpurifier.png',
      'text': 'Water Purifier \nRepair',
      'type': 'Water Purifier Repair'
    },
    {
      'image': 'assets/images/washingmachine.png',
      'text': 'Washing Machine \nRepair',
      'type': 'Washing Machine Repair'
    },
    {
      'image': 'assets/images/geyser.png',
      'text': 'Geyser Repair & Service',
      'type': 'Geyser Repair'
    },
    {
      'image': 'assets/images/tv.png',
      'text': 'Led TV Repair',
      'type': 'Led Tv Repair'
    },
  ];

  final List<Map<String, String>> _twoCards = [
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
      body: RefreshIndicator(
        onRefresh: () async {
          await apicontroller.fetchFirstServices();
          await apicontroller.fetchSecondServices();
        },
        child: SingleChildScrollView(
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
                      onPressed: () {
                        final cartController = Get.find<CartController>();

                        if (cartController.itemCount > 0) {
                          Get.to(ServiceSummaryPage());
                        } else {
                          Get.defaultDialog(
                            title: 'Cart is Empty',
                            middleText:
                                'You haven\'t added any items to your cart.',
                            confirm: TextButton(
                              onPressed: () {
                                Get.back(); // Close the dialog
                              },
                              child: const Text('OK'),
                            ),
                          );
                        }
                      },
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
                height: 400,
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
                    Wrap(
                      spacing: 0.0,
                      runSpacing: 0.0,
                      children: _twoCards.map((card) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width /
                              2, // Half of the screen width
                          child: GestureDetector(
                            onTap: () {
                              Get.to(
                                () => DetailsPage(
                                  itemType: card['type']!,
                                  image: card['image']!,
                                ),
                              );
                            },
                            child: CustomTwoCard(
                              image: card['image']!,
                              text: card['text']!,
                            ),
                          ),
                        );
                      }).toList(),
                    )
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
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Vacuum Cleaner Repair & Service',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Obx(() {
                if (apicontroller.isLoadingSecond.value) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                final services = apicontroller.secondServiceList;
                if (services.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(child: Text('No services available')),
                  );
                }

                return ListView.builder(
                  itemCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  itemBuilder: (context, index) {
                    final service = services[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: EachItemListTile(
                        service: service,
                      ),
                    );
                  },
                );
              }),

              // AC Repair Section
              // AC Repair Section
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'AC Repair & Service',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Obx(() {
                if (apicontroller.isLoadingFirst.value) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                if (apicontroller.firstServiceList.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(child: Text('No AC services available')),
                  );
                }

                return ListView.builder(
                  itemCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  itemBuilder: (context, index) {
                    final service = apicontroller.firstServiceList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: EachItemListTile(
                        service: service,
                      ),
                    );
                  },
                );
              }),

              // Vacuum Cleaner Section

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
              ),
              Obx(() {
                final cartController = Get.find<CartController>();

                return cartController.itemCount > 0
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: CartSummaryWidget(),
                      )
                    : SizedBox.shrink();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
