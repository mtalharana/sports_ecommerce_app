import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
  factory Product.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, dynamic> data = doc.data()!;
    return Product(
      id: doc.id,
      title: data['title'],
      description: data['description'],
      price: data['price'],
      imageUrl: data['imageUrl'],
    );
  }

  void add(List<Product> cartProducts) {}
}
