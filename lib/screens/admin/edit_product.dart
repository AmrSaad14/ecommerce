import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce3/constants.dart';
import 'package:ecommerce3/models/product.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce3/services/store.dart';

class EditProduct extends StatefulWidget {

  static const String routeName = '/edit';
  static Route route(){
    return MaterialPageRoute(builder: (_)=> EditProduct(),
        settings: RouteSettings(name: routeName)
    );}

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _store.loadProducts(),
        builder:(context,snapshot)
        {
          if(snapshot.hasData){
            List<Product>productsList =[];
            for (var doc in snapshot.data!.docs){
              var data = doc.data() as Map;
              productsList.add(Product(
                price: data[kProductPrice],
                name: data[kProductName],
                description: data[kProductDescription],
                image: data [kProductImage],
                category: data[kProductCategory],
              )
              );
            }
         return ListView.builder(
           itemBuilder: (context,index)=> Text(productsList[index].name.toString(),
          style: TextStyle(color: Colors.black,),),
          itemCount: productsList.length,

        );
          }else {
            return Center(child: Text('Loading'));
          }
        }
      ),
    );
  }

}
