import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/app/app.router.dart';

import 'package:whatsapp_stacked/ui/views/register/models/register_request_model.dart';
import 'package:whatsapp_stacked/ui/views/register/register_view.form.dart';
import 'package:whatsapp_stacked/ui/views/register/repository/register_repository_implementation.dart';

class RegisterViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();

  final registerRepo = RegisterRepositoryImplementation();
  void registerApiRequest() async {
    final registerRequest = RegisterRequest(
        email: emailValue.toString(),
        password: passwordValue.toString(),
        fullName: fullNameValue.toString());

    final bool register = await registerRepo.register(registerRequest);

    if (register) {
      _navigationService.replaceWithLoginView();
    } else {
      debugPrint("registration failed");
    }
  }

  void ontap() {
    _navigationService.replaceWithLoginView();
  }
}
