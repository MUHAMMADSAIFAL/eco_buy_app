import 'package:eco_buy_app/eco_buy_app/utils/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppTextField extends StatefulWidget {
  TextInputAction? inputAction;
  FocusNode? focusNode;
  String? hintText;
  TextEditingController? controller;
  String? Function(String?)? validate;
  bool? isEmail;
  Widget? icon;
  AppTextField(
      {super.key,
      this.hintText,
      this.controller,
      this.validate,
      this.icon,
      this.isEmail = false,
      this.inputAction,
      this.focusNode});

  @override
  State<AppTextField> createState() => _AppTextFieldState();
  bool ispasswordd = false;
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        textInputAction: widget.inputAction,
        keyboardType: widget.ispasswordd == true
            ? TextInputType.visiblePassword
            : TextInputType.numberWithOptions(),
        focusNode: widget.focusNode,
        obscureText: widget.ispasswordd,
        controller: widget.controller,
        validator: widget.validate,
        cursorColor: Appcolor.black,
        decoration: InputDecoration(
          fillColor: Appcolor.white,
          filled: true,
          suffixIcon: widget.isEmail == true
              ? Icon(Icons.email)
              : IconButton(
                  onPressed: () {
                    widget.ispasswordd = !widget.ispasswordd;
                    setState(() {});
                  },
                  icon: Icon(widget.ispasswordd
                      ? Icons.visibility_off
                      : Icons.visibility),
                ),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Appcolor.black, width: 2)),
          hintText: widget.hintText ?? "hint text",
          hintStyle: TextStyle(fontWeight: FontWeight.bold),
          contentPadding: const EdgeInsets.all(10),
        ),
      ),
    );
  }
}
