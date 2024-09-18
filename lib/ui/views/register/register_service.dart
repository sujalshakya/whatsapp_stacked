import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/services/firebase_auth_service.dart';

class RegisterService {
  final _firebaseAuth = locator<FirebaseAuthService>();
  Future<String> registerFirebase(String email, String password) async {
    try {
      await _firebaseAuth.firebaseAuth.createUserWithEmailAndPassword(
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
