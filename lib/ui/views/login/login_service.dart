import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginService {
  final _firebaseAuth = FirebaseAuth.instance;
  loginFirebase(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "true";
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return e.toString();
    }
  }
}
