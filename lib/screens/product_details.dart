// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, type_init_formals

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_ecommerce_app/models/products.dart';
import 'package:sports_ecommerce_app/screens/cart_screen.dart';
import 'package:sports_ecommerce_app/screens/home_screen.dart';

class ProductDetails extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final int price;
  final String imageUrl;
  ProductDetails(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
              child: Row(
                children: [
                  InkWell(
                      onTap: (() {
                        Get.to(HomeScreen());
                      }),
                      child: Icon(Icons.arrow_back_ios_new)),
                  Spacer(),
                  Text(
                    ('ProductDetails'),
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.shopping_cart),
                ],
              ),
            ),
            Container(
              height: 300,
              width: 1000,
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 18,
                right: 18,
              ),
              child: Row(
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Text(
                    price.toString(),
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 18,
                right: 18,
              ),
              child: Text(
                'Product Description',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 18,
                right: 18,
              ),
              child: Text(
                description,
                textAlign: TextAlign.justify,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
            ),
            Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(
                  top: 10, left: 18, right: 18, bottom: 20),
              child: TextButton(
                onPressed: () {
                  Get.to(CartScreens(
                      product: Product(
                          id: id,
                          title: title,
                          description: description,
                          price: price.toDouble(),
                          imageUrl: imageUrl)));
                },
                child: Text(
                  'Add to Cart',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
