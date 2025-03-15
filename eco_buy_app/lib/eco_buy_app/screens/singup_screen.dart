import 'package:eco_buy_app/eco_buy_app/screens/login_screen.dart';
import 'package:eco_buy_app/eco_buy_app/services/firebase_services.dart';
import 'package:eco_buy_app/eco_buy_app/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';
import '../widgets/app_button.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({super.key});

  @override
  State<SingupScreen> createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailC = TextEditingController();
    TextEditingController passwordC = TextEditingController();
    TextEditingController retypePasswordc = TextEditingController();
    bool retypepassword = true;
    bool FormStateLoading = false;
    final formkey = GlobalKey<FormState>();
    dispose() {
      emailC.dispose();
      passwordC.dispose();
      retypePasswordc.dispose();
    }

    submit() async {
      if (formkey.currentState!.validate()) {
        if (passwordC.text == retypePasswordc.text) {
          setState(() {
            FormStateLoading = true;
          });
          String? accountstatus =
              await FirebaseServices.CreateAccount(emailC.text, passwordC.text);

          if (accountstatus != null) {
            setState(() {
              FormStateLoading = false;
            });
          } else {
            Navigator.pop(context);
          }
        }
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Appcolor.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "WELLCOME \n Please Create Your Account",
                textAlign: TextAlign.center,
                style: Ecostyle.bold,
              ),
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
                        inputAction: TextInputAction.newline,
                      ),
                      AppTextField(
                        validate: (v) {
                          if (v!.isEmpty) {
                            return "Password Should not Empty";
                          }
                          return null;
                        },
                        hintText: 'Retype password',
                        controller: retypePasswordc,
                      ),
                      AppButton(
                        title: 'SIGN UP',
                        isloginbutton: true,
                        onpress: () {
                          submit();
                        },
                        isloading: FormStateLoading,
                      ),
                    ],
                  ),
                ),
              ),
              AppButton(
                title: 'BACK TO LOGIN',
                isloginbutton: false,
                onpress: () {
                  Navigator.pop(
                    context,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
