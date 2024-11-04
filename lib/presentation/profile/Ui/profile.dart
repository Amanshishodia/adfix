import 'package:adfix/presentation/profile/Ui/ProfileEditPage/ProfileEditPage.dart';
import 'package:adfix/presentation/profile/Ui/myBookingPage/myBookingPage.dart';
import 'package:adfix/presentation/profile/widget/Logout_Button.dart';
import 'package:adfix/presentation/profile/widget/cardWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/Profile_Items.dart';
import 'helpPage/ui/helpPage.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // Ensures content is scrollable
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/Profile_pic.png',
                        height: 40,
                        width: 40,
                      ),
                      const SizedBox(width: 10),
                      // Add spacing between image and text
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Satyam',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 15),
                          ),
                          Text(
                            '+91 808192914',
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Get.to(ProfileEditPage());
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CardWidget(
                  image: "assets/images/Notes.png",
                  text: "My Booking",
                  ontap: () {
                    Get.to(MyBookingPage());
                  },
                ),
                CardWidget(
                  image: "assets/images/Wallet.png",
                  text: "Wallet",
                  ontap: () {},
                ),
                CardWidget(
                  image: "assets/images/Headphones.png",
                  text: "Help & Support",
                  ontap: () {
                    Get.to(HelpPage());
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width *
                  0.9, // Adjusts to screen size
              height: 4,
              color: const Color(0xffD9D9D9),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(
                children: [
                  ProfileItems(
                    ontap: () {},
                    text: "My Plans",
                    image: "assets/images/Notebook.png",
                  ),
                  const SizedBox(height: 20),
                  ProfileItems(
                    ontap: () {},
                    text: "Plus Membership",
                    image: "assets/images/Badge.png",
                  ),
                  const SizedBox(height: 20),
                  ProfileItems(
                    ontap: () {},
                    text: "My Rating",
                    image: "assets/images/Favorite.png",
                  ),
                  const SizedBox(height: 20),
                  ProfileItems(
                    ontap: () {},
                    text: "Manage Addresses",
                    image: "assets/images/Location.png",
                  ),
                  const SizedBox(height: 20),
                  ProfileItems(
                    ontap: () {},
                    text: "Manage Payment methods",
                    image: "assets/images/Creditcard.png",
                  ),
                  const SizedBox(height: 20),
                  ProfileItems(
                    ontap: () {},
                    text: "Settings",
                    image: "assets/images/Settings.png",
                  ),
                  const SizedBox(height: 20),
                  ProfileItems(
                    ontap: () {},
                    text: "About Adfix",
                    image: "assets/images/ad.png",
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const SizedBox(height: 100),
            LogoutButton(),
          ],
        ),
      ),
    );
  }
}
