import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../HomePage/widget/EachItemListTile.dart';
import '../Controller/DetailPageContoller.dart';
import '../widgets/offer.dart';
import '../widgets/option.dart';

class DetailsPage extends StatelessWidget {
  final String? itemType;
  final String? image;

  DetailsPage({Key? key, this.itemType, this.image}) : super(key: key);

  final DetailsController controller = Get.put(DetailsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: controller.fetchData(itemType!), // Fetch data once
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator()); // Show loading indicator
            } else if (snapshot.hasError) {
              return Center(
                  child:
                      Text("Error: ${snapshot.error}")); // Show error message
            } else {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.asset('assets/images/appbarimage.png'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          return Center(child: CircularProgressIndicator());
                        }

                        final itemData = controller.itemData.value;
                        if (itemData == null || itemData.services.isEmpty) {
                          return Center(child: Text("No data available"));
                        }

                        final firstService = itemData.services[0];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              firstService.serviceName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
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
                                                style: TextStyle(fontSize: 12)),
                                          ],
                                        ),
                                        Text('Verify quotes & 30 days warranty',
                                            style: TextStyle(fontSize: 10)),
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
                    // Offers Section
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
                    // Services Section
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("Servicing",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 300, // Adjust this height based on your content
                      child: Obx(() {
                        final services =
                            controller.itemData.value?.services ?? [];
                        return ListView.builder(
                          itemCount: services.length,
                          shrinkWrap: true, // Ensure the list wraps its content
                          itemBuilder: (context, index) {
                            return Eachitemlisttile(service: services[index]);
                          },
                        );
                      }),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
