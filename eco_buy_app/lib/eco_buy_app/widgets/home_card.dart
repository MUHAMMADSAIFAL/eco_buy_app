import 'package:eco_buy_app/eco_buy_app/utils/colors.dart';
import 'package:eco_buy_app/eco_buy_app/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String? title;
  const HomeCard({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [
            Colors.blueAccent.withOpacity(0.8),
            Colors.redAccent.withOpacity(0.8),
          ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Text(
            title ?? "TITLE",
            style: Ecostyle.bold.copyWith(color: Appcolor.white),
          ),
        ),
      ),
    );
  }
}
