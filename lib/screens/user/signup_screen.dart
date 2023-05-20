import 'package:ecommerce3/constants.dart';
import 'package:ecommerce3/custom_widgets/app_logo.dart';
import 'package:ecommerce3/custom_widgets/custom_text_field.dart';
import 'package:ecommerce3/provider/model_hud.dart';
import 'package:ecommerce3/screens/user/home_page.dart';
import 'package:ecommerce3/screens/user/login_Screen.dart';
import 'package:ecommerce3/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signup';
  static Route route(){
    return MaterialPageRoute(builder: (_)=> SignUpScreen(),
        settings: RouteSettings(name: routeName)
    );}

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final auth = Auth() ;

  String? password;

  String? email;


  @override
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: mainColor,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHud>(context).isLoading,
        child: Form(
          key: _globalKey,
          child: ListView(
            children: [
              app_logo(),
              SizedBox(height: height*.07,),
              CustomTextField(
                  icon: Icons.perm_identity ,
                  hint: 'Enter your name'),
              SizedBox(height: height*.03,),
              CustomTextField(
                onChanged: (data){
                  email = data;
                },
                  icon: Icons.email ,
                  hint: 'Enter your email'),
              SizedBox(height: height*.03,),
              CustomTextField(
                onChanged: (data){password = data;},
                  icon: Icons.lock ,
                  hint: 'Enter your password'),
              SizedBox(height: height*.05,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 120.0),
                child: Builder(
                  builder:(context)=> ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                          backgroundColor: MaterialStateProperty.all(Colors.black)),
                      onPressed: ()async{
                        final modelHud = Provider.of<ModelHud>(context,listen: false);
                        modelHud.changeIsLoading(true,);
                        if(_globalKey.currentState!.validate()) {
                          try {
                            await auth.signUp(email!, password!);
                            modelHud.changeIsLoading(false);
                            Navigator.pushNamed(context, HomePage.routeName);
                          } on FirebaseAuthException catch (e) {
                            modelHud.changeIsLoading(false);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(e.message!)
                            ));
                          }}
                        modelHud.changeIsLoading(false);
                      },
                      child: Text('Sign Up',style: TextStyle(color: Colors.white,fontSize: 18),)),
                ),
              ),
              SizedBox(height: height*.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(' have an acount ?  ',style: TextStyle(color: Colors.white,fontSize: 16,),),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      child: Text('Login',style: TextStyle(fontSize: 16),))
                ],
              )
            ],
          ),
        ),
      ),
    );  }
}

