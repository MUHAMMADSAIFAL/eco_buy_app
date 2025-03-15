import 'package:flutter/material.dart';
import '../utils/colors.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  String? title;
  bool? isloginbutton;
  VoidCallback? onpress;
  bool? isloading;
  Color? color;
  Color? tcolor;

  AppButton(
      {super.key,
      this.title,
      this.isloginbutton,
      this.onpress,
      this.color,
      this.tcolor,
      this.isloading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: isloginbutton == false
              ? color ?? Appcolor.white
              : color ?? Appcolor.black,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: isloginbutton == false
                  ? color ?? Appcolor.black
                  : color ?? Appcolor.white),
        ),
        child: Visibility(
          visible: isloading! ? false : true,
          child: Center(
              child: isloading == false
                  ? Text(title ?? "Button",
                      style: TextStyle(
                          color: isloginbutton == false
                              ? tcolor ?? Appcolor.black
                              : tcolor ?? Appcolor.white))
                  : Center(
                      child: CircularProgressIndicator(),
                    )),
        ),
      ),
    );
  }
}
