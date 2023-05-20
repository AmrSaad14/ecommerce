import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';
  static Route route(){
    return MaterialPageRoute(builder: (_)=> HomePage(),
        settings: RouteSettings(name: routeName)
    );}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

    );
  }
}
