import 'package:ecommerce3/constants.dart';
import 'package:ecommerce3/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Store {

  CollectionReference products = FirebaseFirestore.instance.collection(
      'products');

  addProduct(Product product) {
    products.add({
      kProductName: product.name,
      kProductDescription: product.description,
      kProductImage: product.image,
      kProductCategory: product.category,
      kProductPrice: product.price,
    });
  }

  Stream <QuerySnapshot> loadProducts() {

    return FirebaseFirestore.instance.collection('products').snapshots();
  }
}