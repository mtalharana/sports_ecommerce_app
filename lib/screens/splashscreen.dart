// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:sports_ecommerce_app/screens/Screen2.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 5000,
      splash: Image.asset('assets/images/logo.png'),
      nextScreen: Screen2(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.black,
    );
  }
}
