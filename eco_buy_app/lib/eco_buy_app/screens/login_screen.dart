import 'package:eco_buy_app/eco_buy_app/screens/home_screen.dart';
import 'package:eco_buy_app/eco_buy_app/services/firebase_services.dart';
import 'package:eco_buy_app/eco_buy_app/utils/styles.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../widgets/app_button.dart';
import '../widgets/app_textfield.dart';
import 'singup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailC = TextEditingController();
    TextEditingController passwordC = TextEditingController();
    final formkey = GlobalKey<FormState>();
    bool FormStateLoading = false;

    FocusNode passwordfocus;
    dispose() {
      emailC.dispose();
      passwordC.dispose();
    }

    submit() async {
      if (formkey.currentState!.validate()) {
        String? accountstatus =
            await FirebaseServices.signInAccount(emailC.text, passwordC.text);

        if (accountstatus != null) {
          setState(() {
            FormStateLoading = false;
          });
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomeScreen();
          }));
        }
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Appcolor.white,
        appBar: AppBar(
          title: Text("data"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("WELLCOME \n Please Login Frist",
                  textAlign: TextAlign.center, style: Ecostyle.bold),
              SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      AppTextField(
                        validate: (v) {
                          if (v!.isEmpty ||
                              !v.contains("@") ||
                              !v.contains(".com")) {
                            return "Email is badly formated";
                          }
                          return null;
                        },
                        icon: const Icon(Icons.email),
                        isEmail: true,
                        hintText: "Email.com",
                        controller: emailC,
                        inputAction: TextInputAction.newline,
                      ),
                      AppTextField(
                        validate: (v) {
                          if (v!.isEmpty) {
                            return "Password Should not Empty";
                          }
                          return null;
                        },
                        hintText: "Password",
                        controller: passwordC,
                      ),
                      AppButton(
                        title: 'LOGIN',
                        onpress: () => submit(),
                      ),
                    ],
                  ),
                ),
              ),
              AppButton(
                  title: 'CREATE NEW ACCOUNT',
                  isloginbutton: false,
                  onpress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SingupScreen(),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
