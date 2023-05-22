import 'package:ecommerce3/constants.dart';
import 'package:ecommerce3/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference products = FirebaseFirestore.instance.collection('products');

  addProduct(Product product) {
    products.add({
      kProductName: product.name,
      kProductDescription: product.description,
      kProductImage: product.image,
      kProductCategory: product.category,
      kProductPrice: product.price,
    }
    );
  }

  Stream <QuerySnapshot> loadProducts() {

    return _firestore.collection('products').snapshots();

  }

  deleteProduct(docId){
    _firestore.collection('products').doc(docId).delete();
}
editProduct(data , docId){
    _firestore.collection('products').doc(docId).update(data);
}
}