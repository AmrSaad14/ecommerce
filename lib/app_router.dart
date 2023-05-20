import 'package:ecommerce3/screens/admin/add_product.dart';
import 'package:ecommerce3/screens/admin/admin_page.dart';
import 'package:ecommerce3/screens/admin/edit_product.dart';
import 'package:ecommerce3/screens/user/home_page.dart';
import 'package:ecommerce3/screens/user/login_Screen.dart';
import 'package:ecommerce3/screens/user/signup_screen.dart';
import 'package:flutter/material.dart';

class AppRouter{
static Route? onGenerateRoute ( RouteSettings settings){
  print('The route is ${settings.name}');
  switch (settings.name){
    case '/' :
      return LoginScreen.route();
    case LoginScreen.routeName :
      return LoginScreen.route();
    case SignUpScreen.routeName :
      return SignUpScreen.route();
    case HomePage.routeName :
      return HomePage.route();
    case AdminPage.routeName :
      return AdminPage.route();
    case AddProduct.routeName :
      return AddProduct.route();
    case EditProduct.routeName :
      return EditProduct.route();

    default : return _errorRoute();
  }

}

  static Route? _errorRoute() {
    return MaterialPageRoute(builder: (_)=> Scaffold(appBar: AppBar(title: Text('Error'),),),
        settings: RouteSettings(name: '/error')
    );
  }
}