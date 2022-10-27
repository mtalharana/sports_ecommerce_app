// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:sports_ecommerce_app/screens/cart_screen.dart';
import 'package:sports_ecommerce_app/screens/home_screen.dart';
import 'package:sports_ecommerce_app/screens/order_confirm.dart';
import 'package:sports_ecommerce_app/screens/product_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OrderConfirmScreen(),
    );
  }
}
