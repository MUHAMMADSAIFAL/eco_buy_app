import 'package:eco_buy_app/eco_buy_app/screens/web_site/add.dart';
import 'package:eco_buy_app/eco_buy_app/screens/web_site/card.dart';
import 'package:eco_buy_app/eco_buy_app/screens/web_site/dashbord.dart';
import 'package:eco_buy_app/eco_buy_app/screens/web_site/delete.dart';
import 'package:eco_buy_app/eco_buy_app/screens/web_site/update.dart';
import 'package:eco_buy_app/eco_buy_app/screens/web_site/web_home.dart';
import 'package:eco_buy_app/eco_buy_app/screens/web_site/web_site_screen.dart';
import 'package:eco_buy_app/eco_buy_app/utils/colors.dart';
import 'package:eco_buy_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Appcolor.border));
  runApp(MyApp());

// ...
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'E COMMERECE APP',
          home: WebHome(),
          routes: {
            WebLogin.id: (context) => WebLogin(),
            WebHome.id: (context) => WebHome(),
            Add.id: (context) => Add(),
            Update.id: (context) => Update(),
            Delete.id: (context) => Delete(),
            Dashbord.id: (context) => Dashbord(),
            CardScreen.id: (context) => CardScreen(),
          });
    });
  }
}
