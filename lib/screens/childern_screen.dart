// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sports_ecommerce_app/screens/product_details.dart';

final List<String> imgList = [
  'assets/images/image 18.png',
  'assets/images/image 19.jpg',
  'assets/images/image 20.jpg',
];

class ChildScreen extends StatelessWidget {
  const ChildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              child: CarouselSlider(
                options: CarouselOptions(),
                items: imgList
                    .map((item) => Container(
                          child: Center(
                              child: Image.asset(item,
                                  fit: BoxFit.fill, width: 1000, height: 220)),
                        ))
                    .toList(),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 18, top: 26),
                child: Text(
                  'Best Selling',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(right: 18, top: 30),
                child: Text(
                  'View All',
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 140,
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('products').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        DocumentSnapshot doc = snapshot.data!.docs[index];
                        return InkWell(
                          onTap: (() {
                            Get.to(ProductDetails(
                                id: doc['id'],
                                title: doc['title'],
                                price: doc['price'],
                                description: doc['description'],
                                imageUrl: doc['imageUrl']));
                          }),
                          child: Container(
                              height: 120,
                              child: Padding(
                                padding: EdgeInsets.only(left: 18),
                                child: Container(
                                  height: 200,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        doc['imageUrl'],
                                        height: 100,
                                        width: 200,
                                      ),
                                      Text(
                                        doc['title'],
                                        style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        '${doc['price'].toString()} \$',
                                        style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        );
                      });
                } else {
                  return Text("No data available");
                }
              },
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 18, top: 26),
                child: Text(
                  'New Arrivals',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(right: 18, top: 30),
                child: Text(
                  'View All',
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 140,
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('products').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        DocumentSnapshot doc = snapshot.data!.docs[index];
                        return InkWell(
                          onTap: (() {
                            Get.to(ProductDetails(
                                id: doc['id'],
                                title: doc['title'],
                                price: doc['price'],
                                description: doc['description'],
                                imageUrl: doc['imageUrl']));
                          }),
                          child: Container(
                              height: 120,
                              child: Padding(
                                padding: EdgeInsets.only(left: 18),
                                child: Container(
                                  height: 200,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        doc['imageUrl'],
                                        height: 100,
                                        width: 200,
                                      ),
                                      Text(
                                        doc['title'],
                                        style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        '${doc['price'].toString()} \$',
                                        style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        );
                      });
                } else {
                  return Text("No data available");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
