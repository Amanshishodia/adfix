import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/PersistantCartWidget.dart';
import '../../HomePage/controller/CartController.dart';
import '../../HomePage/widget/EachItemListTile.dart';
import '../Controller/DetailPageContoller.dart';
import '../widgets/offer.dart';
import '../widgets/option.dart';

class DetailsPage extends StatelessWidget {
  final String? itemType;
  final String? image;

  DetailsPage({Key? key, this.itemType, this.image}) : super(key: key);

  final DetailsController controller = Get.put(DetailsController());
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            FutureBuilder(
              future: controller.fetchData(itemType!), // Fetch data once
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  ); // Show loading indicator
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Error: ${snapshot.error}"),
                  ); // Show error message
                } else {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 80),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image.asset('assets/images/appbarimage.png'),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(Icons.arrow_back_outlined),
                                    ),
                                    Icon(Icons.search),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Obx(() {
                              if (controller.isLoading.value) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }

                              final itemData = controller.itemData.value;
                              if (itemData == null ||
                                  itemData.services.isEmpty) {
                                return Center(child: Text("No data available"));
                              }

                              final firstService = itemData.services[0];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    firstService.serviceName,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "⭐ ${firstService.rating} (${firstService.reviews} Reviews)",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    width: double.infinity,
                                    height: 59,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[350],
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                      'assets/images/Verified.png'),
                                                  SizedBox(width: 4),
                                                  Text('Adfix Cover',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ],
                                              ),
                                              Text(
                                                  'Verify quotes & 30 days warranty',
                                                  style:
                                                      TextStyle(fontSize: 10)),
                                            ],
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.arrow_forward_ios,
                                                size: 14, color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Offer(
                                    img: 'assets/images/tag.png',
                                    text1: 'Buy more save more',
                                    text2: 'Buy more save more'),
                                Offer(
                                    img: 'assets/images/star.png',
                                    text1: 'Save 10% on every order',
                                    text2: 'Get Plus now'),
                                Offer(
                                    img: 'assets/images/offertag.png',
                                    text1: 'Amazon cashback up to ₹50',
                                    text2: 'Get cashback via Amazon Pay'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Option(),
                                Option(),
                                Option(),
                                Option(),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text("Servicing",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 300,
                            child: Obx(() {
                              final services =
                                  controller.itemData.value?.services ?? [];
                              return ListView.builder(
                                itemCount: services.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return EachItemListTile(
                                      service: services[index]);
                                },
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
            Obx(() {
              final cartController = Get.find<CartController>();

              return cartController.itemCount > 0
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 8),
                              color: Colors.green[900],
                              child: Text(
                                "${cartController.itemCount} items in cart",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "₹${cartController.total.value.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Navigate to cart page
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 109, 42, 216),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    child: Text(
                                      "View Cart",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox.shrink();
            }),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CartSummaryWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
