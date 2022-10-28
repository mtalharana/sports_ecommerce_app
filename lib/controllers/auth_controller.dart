// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_ecommerce_app/screens/home_screen.dart';
import 'package:sports_ecommerce_app/screens/login.dart';
import 'package:sports_ecommerce_app/screens/splashscreen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _User;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _User = Rx<User?>(_auth.currentUser);
    _User.bindStream(_auth.userChanges());
    ever(_User, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => Splashscreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }

  void register(String email, password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException {
      Get.snackbar(
        'User Error',
        'Not Successful',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        titleText: Text(
          'Error',
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        messageText: Text(
          'Wrong Email or Password',
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      );
    }
  }

  void login(String email, password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        'Login',
        'Not Successful',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        titleText: Text('Error',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            textAlign: TextAlign.center),
        messageText: Text(
          'Wrong Email or Password',
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
  }

  void signout() async {
    await _auth.signOut();
  }
}
