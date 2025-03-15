import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  static const String id = "Card";

  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("CardScreen"),
      ),
    );
  }
}
