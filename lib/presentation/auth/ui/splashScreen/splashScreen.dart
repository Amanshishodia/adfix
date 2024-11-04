import 'package:adfix/presentation/auth/controller/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../bottomNav/ui/myHome.dart';
import '../sign_in/sign_in.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  final AuthController authController = Get.put(AuthController());
  late AnimationController _personController;
  late Animation<double> _personAnimation;
  late AnimationController _textController;
  late Animation<double> _textAnimation;
  bool showShadow = true;

  @override
  void initState() {
    super.initState();

    // Person animation controller
    _personController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    // Person movement animation
    _personAnimation =
        Tween<double>(begin: -100, end: 40).animate(CurvedAnimation(
      parent: _personController,
      curve: Curves.easeInOut,
    ))
          ..addListener(() {
            setState(() {});
          });

    // Text animation controller
    _textController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    // Fade-in effect for the text
    _textAnimation = Tween<double>(begin: 0, end: 1).animate(_textController)
      ..addListener(() {
        setState(() {});
      });

    // Start the animations
    _personController.forward().whenComplete(() {
      _textController.forward().whenComplete(() {
        // After the animation, navigate based on login status
        if (authController.isLoggedIn.value) {
          Get.off(() => Myhome());
        } else {
          Get.off(() => SignIn());
        }
      });
    });
    // Hide the shadow after the animation starts
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        showShadow = false;
      });
    });
  }

  @override
  void dispose() {
    _personController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.green[900],
      body: Stack(
        children: [
          // Shadow effect at the beginning
          if (showShadow)
            Center(
              child: Container(
                width: screenWidth * 0.15,
                height: screenHeight * 0.02,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
              ),
            ),

          // Running person animation
          Positioned(
            left: _personAnimation.value,
            top: screenHeight * 0.5 - 40,
            child: Image.asset(
              'assets/images/person.png',
              // replace with your running person image
              width: screenWidth * 0.2,
              height: screenHeight * 0.1,
              color: Colors.yellow,
            ),
          ),

          // Application name "Adfix" with fade-in effect
          Center(
            child: Opacity(
              opacity: _textAnimation.value,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: screenWidth * 0.27),
                  Image.asset(
                    'assets/images/logo.png', // same image for continuity
                    width: screenWidth * 0.6,
                    height: screenHeight * 0.3,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
