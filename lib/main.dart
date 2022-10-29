// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:sports_ecommerce_app/controllers/auth_controller.dart';
import 'package:sports_ecommerce_app/controllers/product_controller.dart';
import 'package:sports_ecommerce_app/screens/cart_screen.dart';
import 'package:sports_ecommerce_app/screens/home_screen.dart';
import 'package:sports_ecommerce_app/screens/order_confirm.dart';
import 'package:sports_ecommerce_app/screens/product_details.dart';
import 'package:get/get.dart';
import 'package:sports_ecommerce_app/screens/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthController()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
