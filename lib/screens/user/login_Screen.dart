import 'package:ecommerce3/constants.dart';
import 'package:ecommerce3/custom_widgets/app_logo.dart';
import 'package:ecommerce3/custom_widgets/custom_text_field.dart';
import 'package:ecommerce3/provider/admin_mode.dart';
import 'package:ecommerce3/provider/model_hud.dart';
import 'package:ecommerce3/screens/admin/admin_page.dart';
import 'package:ecommerce3/screens/user/home_page.dart';
import 'package:ecommerce3/screens/user/signup_screen.dart';
import 'package:ecommerce3/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/';
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => LoginScreen(),
        settings: RouteSettings(name: routeName));
  }

  final auth = Auth();
  String? password;
  String? email;
  bool isAdmin = false;
  final adminPassword = 'admin1234';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: mainColor,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHud>(context).isLoading,
        child: Form(
          key: _globalKey,
          child: ListView(
            children: [
              app_logo(),
              SizedBox(
                height: height * .07,
              ),
              CustomTextField(
                icon: Icons.email,
                hint: 'Enter your email',
                onChanged: (data) {
                  email = data;
                },
              ),
              SizedBox(
                height: height * .03,
              ),
              CustomTextField(
                  onChanged: (data) {
                    password = data;
                  },
                  icon: Icons.lock,
                  hint: 'Enter your password'),
              SizedBox(
                height: height * .05,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 120.0),
                child: Builder(
                  builder: (context) => ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black)),
                      onPressed: ()  {
                        _validate(context);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an acount ?  ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(fontSize: 16),
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Row(
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        Provider.of<AdminMode>(context, listen: false)
                            .changeIsAdmin(true);
                      },
                      child: Text(
                        'I\'m an admin',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Provider.of<AdminMode>(context).isAdmin
                                ? mainColor
                                : Colors.white),
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        Provider.of<AdminMode>(context, listen: false)
                            .changeIsAdmin(false);
                      },
                      child: Text(
                        'I\'m a user',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Provider.of<AdminMode>(context).isAdmin
                                ? Colors.white
                                : mainColor),
                      ),
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _validate(BuildContext context) async {
    final modelHud = Provider.of<ModelHud>(context,listen: false);
    modelHud.changeIsLoading(true);
    if (_globalKey.currentState!.validate()) {
      _globalKey.currentState!.save();
      if (Provider.of<AdminMode>(context,listen: false).isAdmin) {
        if (password == adminPassword) {
          try {
            await auth.signIn(email!, password!);
            Navigator.pushNamed(context, AdminPage.routeName);
          } on FirebaseAuthException catch (e) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(e.message!)));
          }
        } else {
          modelHud.changeIsLoading(false);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Something went wrong ! ')));
        }
      } else {
        try {
          await auth.signIn(email!, password!);
          Navigator.pushNamed(context, HomePage.routeName);
        } on FirebaseAuthException catch (e) {
          modelHud.changeIsLoading(false);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.message!)));
        }
      }
    }
    modelHud.changeIsLoading(false);
  }
}