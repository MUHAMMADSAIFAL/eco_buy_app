import 'package:eco_buy_app/eco_buy_app/screens/home_screen.dart';
import 'package:eco_buy_app/eco_buy_app/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({super.key});
  Future<FirebaseApp> inintilize = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: inintilize,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (BuildContext context, AsyncSnapshot streamSnapshot) {
                  if (streamSnapshot.hasError) {
                    return Scaffold(
                      body: Center(
                        child: Text("${streamSnapshot.error}"),
                      ),
                    );
                  }
                  if (streamSnapshot.connectionState ==
                      ConnectionState.active) {
                    User? user = streamSnapshot.data;
                    if (user == null) {
                      return LoginScreen();
                    } else {
                      return HomeScreen();
                    }
                  }
                  return Scaffold(
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Text("CHECKING AUTHENTICATION..."),
                        ),
                        CircularProgressIndicator(),
                      ],
                    ),
                  );
                });
          }
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text("INITILATION..."),
                ),
                CircularProgressIndicator(),
              ],
            ),
          );
        });
  }
}
