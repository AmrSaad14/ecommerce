import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce3/constants.dart';
import 'package:ecommerce3/models/product.dart';
import 'package:ecommerce3/screens/admin/edit_product.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce3/services/store.dart';

class ManageProduct extends StatefulWidget {

  static const String routeName = '/manageProduct';
  static Route route(){
    return MaterialPageRoute(builder: (_)=> ManageProduct(),
        settings: RouteSettings(name: routeName)
    );}

  @override
  State<ManageProduct> createState() => _ManageProductState();
}

class _ManageProductState extends State<ManageProduct> {
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
                pId: doc.id,
              )
              );
            }
         return GridView.builder(
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,childAspectRatio: .8,),
             itemCount: productsList.length,
             itemBuilder: (context,index)=> Padding(
               padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
               child: GestureDetector(
                 onTapUp:(details)async{
                   double dx = details.globalPosition.dx;
                   double dy = details.globalPosition.dy;
                   double dx2 = MediaQuery.of(context).size.width-dx;
                   double dy2 = MediaQuery.of(context).size.width-dy;
                   await showMenu(
                       context: context,
                       position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
                       items: [
                         MyPopupMenuItem(
                           onClick:(){
                             Navigator.pushNamed(context,EditProductScreen.routeName,arguments: productsList[index]);
                             } ,
                             child:
                             Text('Edit')),
                         MyPopupMenuItem(
                           onClick: (){
                             _store.deleteProduct(productsList[index].pId);
                             Navigator.pop(context);
                           },
                             child:
                             Text('Delete')),
                       ]);
                 } ,
                 child: Stack(
                 children: [
                   Positioned.fill(
                     child: Image(
                       fit: BoxFit.fill,
                         image: AssetImage(productsList[index].image as String)
                     ),
                   ),
                   Positioned(
                     bottom: 0,
                       child: Opacity(
                         opacity: 0.6,
                           child: Container(
                             color: Colors.white,
                             height: 60,
                             width: MediaQuery.of(context).size.width,
                             child: Padding(
                               padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(productsList[index].name as String,style: TextStyle(fontWeight: FontWeight.bold),),
                                   Text('\$ ${productsList[index].price}' as String,style: TextStyle(fontWeight: FontWeight.bold),),
                                 ],
                               ),
                             ),
                           )
                       )
                   )
                 ],
           ),
               ),
             )

        );
          }else {
            return Center(child: Text('Loading'));
          }
        }
      ),
    );
  }
}

class MyPopupMenuItem<T> extends PopupMenuItem<T>{
  final Widget child;
  final Function onClick;
  MyPopupMenuItem({required this.child , required this.onClick})
  :super(child: child);

  @override
  PopupMenuItemState<T, PopupMenuItem<T>> createState() {
    return MyPopupMenuItemState();
  }
}

class MyPopupMenuItemState<T,PopMenuItem> extends PopupMenuItemState<T,MyPopupMenuItem<T>>{

  @override
  void handleTap() {
    widget.onClick();
  }
}