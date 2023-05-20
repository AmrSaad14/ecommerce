import 'package:ecommerce3/constants.dart';
import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData? icon;
  Function (String)? onChanged ;
  String? _errorMessage (String str){
    switch(hint){
      case 'Enter your name' : return ' Name is empty' ;
      case 'Enter your email' : return ' Email is empty' ;
      case 'Enter your password' : return ' Password is empty' ;
    }
  }
  CustomTextField({  required this.hint, this.icon , this.onChanged });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        onChanged: onChanged,
        obscureText: hint == 'Enter your password' ?true : false,
        validator: (value){
          if (value!.isEmpty){
            return _errorMessage(hint) ;
          }
        },
        cursorColor: mainColor,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: mainColor),
          prefixIcon:  Icon(icon,color: mainColor,),
          fillColor: secColor,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor),
              borderRadius: BorderRadius.circular(20)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor),
              borderRadius: BorderRadius.circular(20)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor),
              borderRadius: BorderRadius.circular(20)
          ),
        ),
      ),
    );
  }
}

