import 'package:eco_buy_app/eco_buy_app/screens/landing_screen.dart';
import 'package:eco_buy_app/eco_buy_app/screens/web_site/web_site_screen.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, Constraints) {
      if (Constraints.maxWidth > 600) {
        return WebLogin();
      } else {
        return LandingScreen();
      }
    });
  }
}
