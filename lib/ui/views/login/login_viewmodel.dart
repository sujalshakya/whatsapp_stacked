import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/app/app.router.dart';
import 'package:whatsapp_stacked/ui/views/login/login_view.form.dart';
import 'package:whatsapp_stacked/ui/views/login/models/login_request.dart';
import 'package:whatsapp_stacked/ui/views/login/repository/login_repository_implementation.dart';

class LoginViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();

  final loginRepo = LoginRepositoryImplementation();
  void loginApiRequest() async {
    final loginRequestModel = LoginRequestModel(
        username: emailValue.toString(), password: passwordValue.toString());

    final bool login = await loginRepo.login(loginRequestModel);

    if (login == true) {
      _navigationService.replaceWithHomeView();
    } else {
      debugPrint("login failed");
    }
  }

  void ontap() {
    _navigationService.replaceWithRegisterView();
  }
}
