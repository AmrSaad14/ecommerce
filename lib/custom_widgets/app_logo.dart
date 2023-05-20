
import 'package:ecommerce3/constants.dart';
import 'package:flutter/material.dart';

class app_logo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Container(
        height: MediaQuery.of(context).size.height*0.21,
        child: Stack(
          alignment: Alignment.center,
          children: const [
            Image(image: AssetImage('images/icon.png',),height: 100),
            SizedBox(height: 15,),
            Positioned(bottom: 0,child: Text('Buy it',
              style: TextStyle(
                  fontFamily: 'Pacifico',fontSize: 35,color: secColor),)),
          ],
        ),
      ),
    );
  }
}

