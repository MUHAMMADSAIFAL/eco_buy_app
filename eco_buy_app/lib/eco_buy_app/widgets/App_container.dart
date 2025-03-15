import 'package:eco_buy_app/eco_buy_app/utils/colors.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  double? height;
  double? width;
  double? radius;
  Widget? child;
  Color? color;
  AppContainer(
      {super.key,
      this.height,
      this.width,
      this.radius,
      this.child,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: color ?? Appcolor.red,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
