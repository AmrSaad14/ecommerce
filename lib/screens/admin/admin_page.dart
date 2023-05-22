import 'package:ecommerce3/constants.dart';
import 'package:ecommerce3/screens/admin/add_product.dart';
import 'package:ecommerce3/screens/admin/manage_product.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  static const String routeName = '/admin';
  static Route route(){
    return MaterialPageRoute(builder: (_)=> AdminPage(),
        settings: RouteSettings(name: routeName)
    );}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity,),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, AddProduct.routeName);
          }, child: Text('Add Product')),
          ElevatedButton(onPressed: (){Navigator.pushNamed(context, ManageProduct.routeName);}, child: Text('Edit Product')),
          ElevatedButton(onPressed: (){}, child: Text('Delete Product')),
        ],
      ),
    );
  }
}
