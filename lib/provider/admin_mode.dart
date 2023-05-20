import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminMode extends ChangeNotifier {
  bool isAdmin = false;
  changeIsAdmin (bool value){
    isAdmin = value;
    notifyListeners();
  }

}