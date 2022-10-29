// ignore_for_file: unrelated_type_equality_checks, invalid_use_of_protected_member, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // RxList<Product> products = <Product>[].obs;

  storedata() {
    print('talha');
    firestore.collection('products').add({
      'id': '1',
      'title': 'Nike',
      'description':
          'The radiance lives on in the Nike Air Force 107, the basketball original that puts a fresh spin on what you know best: durably stitched overlays, clean finishes and the perfect amount of flash to make you shine.',
      'price': 1000,
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/sportsecommerce-446a7.appspot.com/o/image%2019.jpg?alt=media&token=40c9e0d2-9a10-4456-a5ce-40bc89f3a167',
    });
  }

  // ignore: prefer_final_fields

}
