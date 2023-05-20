import 'package:ecommerce3/app_router.dart';
import 'package:ecommerce3/firebase_options.dart';
import 'package:ecommerce3/provider/admin_mode.dart';
import 'package:ecommerce3/provider/model_hud.dart';
import 'package:ecommerce3/screens/user/login_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider<ModelHud>(create: (context)=>ModelHud(),),
        ChangeNotifierProvider<AdminMode>(create: (context)=>AdminMode(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: LoginScreen.routeName,

      ),
    );
  }
}
