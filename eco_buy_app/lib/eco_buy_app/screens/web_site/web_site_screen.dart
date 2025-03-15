import 'package:eco_buy_app/eco_buy_app/screens/web_site/web_home.dart';
import 'package:eco_buy_app/eco_buy_app/services/firebase_services.dart';
import 'package:eco_buy_app/eco_buy_app/utils/colors.dart';
import 'package:eco_buy_app/eco_buy_app/utils/styles.dart';
import 'package:eco_buy_app/eco_buy_app/widgets/app_button.dart';
import 'package:eco_buy_app/eco_buy_app/widgets/app_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WebLogin extends StatefulWidget {
  static var id = "weblogin";
  @override
  State<WebLogin> createState() => _WebLoginState();
}

class _WebLoginState extends State<WebLogin> {
  // const WebLogin({super.key});
  TextEditingController usernamecontrollar = TextEditingController();

  TextEditingController passwordcontrollar = TextEditingController();

  final formkey = GlobalKey<FormState>();

  bool formstateloading = false;

  submit(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      setState(() {
        formstateloading != formstateloading;
      });
      await FirebaseServices.adminSigneIn(usernamecontrollar.text)
          .then((Value) async {
        if (Value["username"] == usernamecontrollar.text &&
            Value["password"] == passwordcontrollar.text) {
          try {
            UserCredential user =
                await FirebaseAuth.instance.signInAnonymously();
            if (user != null) {
              Navigator.pushReplacementNamed(context, WebHome.id);
            }
          } catch (e) {
            setState(() {
              formstateloading = false;
            });
            Get.defaultDialog(
              title: "CLOSE",
              onCancel: () => Get.back(),
            );
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Appcolor.background[0], width: 4),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "WELLCOME ADMIN",
                        style: Ecostyle.bold,
                      ),
                      Text(
                        "Login  To Your Account",
                        style: Ecostyle.bold,
                      ),
                      AppTextField(
                          isEmail: true,
                          hintText: "Email...",
                          controller: usernamecontrollar,
                          validate: (v) {
                            if (v!.isEmpty) {
                              return "Email shold not be empty";
                            }
                          }),
                      AppTextField(
                        hintText: "password",
                        controller: passwordcontrollar,
                        validate: (v) {
                          if (v!.isEmpty) {
                            return "password shold not empty";
                          }
                        },
                      ),
                      AppButton(
                        isloading: formstateloading,
                        title: "LOGIN",
                        onpress: () => submit(context),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
