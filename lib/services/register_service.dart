import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterService {
  final _firebaseAuth = FirebaseAuth.instance;
  registerFirebase(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
