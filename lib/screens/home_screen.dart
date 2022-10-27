// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_ecommerce_app/screens/childern_screen.dart';
import 'package:sports_ecommerce_app/screens/menscreen.dart';
import 'package:sports_ecommerce_app/screens/women_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18, top: 20),
                  child: Text('Shop',
                      style: GoogleFonts.inter(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      )),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 18, top: 20),
                  child: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            TabBar(
              indicatorColor: Colors.black,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              padding: EdgeInsets.only(
                right: 0,
              ),
              tabs: [
                Tab(
                    child: Text('Men',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ))),
                Tab(
                    child: Text('Women',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ))),
                Tab(
                    child: Text('Childern',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ))),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  MenScreen(),
                  Women_Screen(),
                  ChildScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
