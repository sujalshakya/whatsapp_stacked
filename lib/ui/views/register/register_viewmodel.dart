import 'package:flutter/material.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/app/app.router.dart';
import 'package:whatsapp_stacked/base/models/user.dart';
import 'package:whatsapp_stacked/ui/views/register/register_view.form.dart';
import 'package:whatsapp_stacked/ui/views/register/repository/register_repository_implementation_service.dart';
import 'package:whatsapp_stacked/base/wrapper/form_viewmodel.dart';

class RegisterViewModel extends FormViewmodelWrapper with $RegisterView {
  final _registerRepo = locator<RegisterRepositoryImp>();

  void registerFirebase() async {
    if (!hasEmailValidationMessage && !hasPasswordValidationMessage) {
      String register = await _registerRepo.register(
        emailController.text,
        passwordController.text,
      );
      if (register == "true") {
        addUser();

        navigationService.replaceWithHomeView();
        snackbarService.showSnackbar(
          message: "Registration Sucessful",
          duration: const Duration(seconds: 1),
        );
      } else {
        snackbarService.showSnackbar(
          message: register,
          duration: const Duration(seconds: 1),
        );
      }
    }
  }

  /// Store user information to firestore.
  void addUser() {
    final User user = User(
        email: emailController.text,
        uid: firebaseAuth.firebaseAuth.currentUser!.uid,
        name: fullNameController.text);

    firebaseAuth.firebaseAuth.currentUser!
        .updateDisplayName(fullNameController.text);

    firestoreService.db
        .collection("users")
        .doc()
        .set(user.toJson())
        .onError((e, _) => debugPrint("Error writing document: $e"));
  }

  /// Navigate to login view.
  void ontap() {
    navigationService.replaceWithLoginView();
  }
}
