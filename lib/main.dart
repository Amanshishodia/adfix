import 'package:adfix/presentation/Payment/ui/wallet.dart';
import 'package:adfix/presentation/auth/controller/AuthController.dart';
import 'package:adfix/presentation/auth/ui/sign_in/sign_in.dart';
import 'package:adfix/presentation/auth/ui/splashScreen/splashScreen.dart';
// import 'package:adfix/presentation/changeAddress/Ui/setAddressPage.dart';
import 'package:adfix/presentation/changeAddress/controller/AddressController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'appBinding.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter bindings are initialized
  Get.put(AddressController());
  await GetStorage.init();
  SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky); // Set immersive sticky mode
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AuthController authController = Get.put(AuthController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: AppBinding(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: TextTheme(
            displayLarge: TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            displayMedium: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            displaySmall: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            headlineLarge: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            headlineMedium: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            headlineSmall: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            titleLarge: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            titleMedium: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            titleSmall: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            bodyLarge: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
            bodyMedium: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
            bodySmall: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
            labelLarge: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            labelMedium: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            labelSmall: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen());
  }
}
//Obx(() => authController.isLoggedIn.value ? Myhome() : SignIn())
