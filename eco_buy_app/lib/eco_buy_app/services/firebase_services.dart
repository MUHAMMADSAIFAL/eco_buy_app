import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  static Future<DocumentSnapshot> adminSigneIn(String id) async {
    var result =
        await FirebaseFirestore.instance.collection("admin").doc(id).get();
    return result;
  }

  static Future<String?> CreateAccount(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == "ERROR_EMAIL_ALREDAY_IN_USE") {
        return "Email already in user";
      }
      if (e.code == "ERROR_WEAK_PASSWORD") {
        return "Password is soo weak";
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String?> signInAccount(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.email != email) {
        return "Your email is not correct";
      }
      if (e.code == "ERROR_WEAK_PASSWORD") {
        return "Password is soo weak";
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
