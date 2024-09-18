import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/app/app.router.dart';
import 'package:whatsapp_stacked/services/firebase_auth_service.dart';
import 'package:whatsapp_stacked/services/firebase_database_service.dart';
import 'package:whatsapp_stacked/ui/views/register/register_view.form.dart';
import 'package:whatsapp_stacked/ui/views/register/repository/register_repository_implementation_service.dart';

class RegisterViewModel extends FormViewModel with $RegisterView {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _firebaseAuth = locator<FirebaseAuthService>();
  final _firestoreService = locator<FirebaseDatabaseService>();
  final _registerRepo = locator<RegisterRepositoryImplementationService>();
  void registerFirebase() async {
    if (!hasEmailValidationMessage && !hasPasswordValidationMessage) {
      String register = await _registerRepo.register(
        emailController.text,
        passwordController.text,
      );
      if (register == "true") {
        addUser();

        _navigationService.replaceWithHomeView();
        _snackbarService.showSnackbar(
          message: "Registration Sucessful",
          duration: const Duration(seconds: 1),
        );
      } else {
        _snackbarService.showSnackbar(
          message: register,
          duration: const Duration(seconds: 1),
        );
      }
    }
  }

  void addUser() {
    final user = <String, String>{
      "email": emailController.text,
      "Uid": _firebaseAuth.firebaseAuth.currentUser!.uid,
      "name": fullNameController.text
    };
    _firebaseAuth.firebaseAuth.currentUser!
        .updateDisplayName(fullNameController.text);

    _firestoreService.db
        .collection("users")
        .doc()
        .set(user)
        .onError((e, _) => debugPrint("Error writing document: $e"));
  }

  void ontap() {
    _navigationService.replaceWithLoginView();
  }
}
