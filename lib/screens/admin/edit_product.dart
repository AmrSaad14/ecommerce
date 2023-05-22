import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce3/constants.dart';
import 'package:ecommerce3/custom_widgets/custom_text_field.dart';
import 'package:ecommerce3/models/product.dart';
import 'package:ecommerce3/screens/admin/manage_product.dart';
import 'package:ecommerce3/services/store.dart';
import 'package:flutter/material.dart';

class EditProductScreen extends StatelessWidget {
  static const String routeName = '/edit';
  static Route route(){
    return MaterialPageRoute(builder: (_)=> EditProductScreen(),
        settings: RouteSettings(name: routeName)
    );}
  String? _name,_price,_description,_category,_imageLocation;
  final GlobalKey<FormState> _globalkey = GlobalKey<FormState>();
  final _store = Store();



  @override
  Widget build(BuildContext context) {
     List<Product> product =  ModalRoute.of(context)!.settings.arguments as List<Product> ;
    return  Scaffold(
      resizeToAvoidBottomInset: true,
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
                _store.editProduct(({
                  kProductPrice : _price,
                  kProductCategory : _category,
                  kProductImage : _imageLocation,
                  kProductDescription : _description,
                  kProductName : _name
                }
                ),product);
              }
            },
                child: Text('Edit Product')),
          ],
        ),
      ),
    );
  }
}
