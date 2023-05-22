import 'package:ecommerce3/constants.dart';
import 'package:ecommerce3/custom_widgets/custom_text_field.dart';
import 'package:ecommerce3/models/product.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce3/services/store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddProduct extends StatelessWidget {
  static const String routeName = '/add';
  static Route route(){
    return MaterialPageRoute(builder: (_)=> AddProduct(),
        settings: RouteSettings(name: routeName)
    );}
  String? _name,_price,_description,_category,_imageLocation;
  final GlobalKey<FormState> _globalkey = GlobalKey<FormState>();
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Form(
        key: _globalkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(hint: 'Product Name',onChanged: (value){_name = value;},),
            SizedBox(height: 10,),
            CustomTextField(hint: 'Product Price',onChanged: (value){_price = value;}),
            SizedBox(height: 10,),
            CustomTextField(hint: 'Product Description',onChanged: (value){_description = value;}),
            SizedBox(height: 10,),
            CustomTextField(hint: 'Product Category',onChanged: (value){_category = value;}),
            SizedBox(height: 10,),
            CustomTextField(hint: 'Product Image',onChanged: (value){_imageLocation = value;}),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              if ( _globalkey.currentState!.validate()){
                _globalkey.currentState!.save();
                _store.addProduct(Product(
                    name: _name ,
                    price: _price ,
                    description: _description ,
                    image: _imageLocation ,
                    category: _category
                )
                );
              }
            },
                child: Text('Add Product')),
          ],
        ),
      ),
    );
  }
}
