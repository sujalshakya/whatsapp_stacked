import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/app/app.router.dart';

import 'package:whatsapp_stacked/ui/views/login/login_view.form.dart';
import 'package:whatsapp_stacked/ui/views/login/repository/login_repository_implementation.dart';

class LoginViewModel extends FormViewModel with $LoginView {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _loginrepo = LoginRepositoryImplementation();

  void loginFirebase() async {
    if (!hasAnyValidationMessage) {
      final login =
          await _loginrepo.login(emailController.text, passwordController.text);
      if (login == true) {
        _navigationService.replaceWithHomeView();
        _snackbarService.showSnackbar(
          message: "Login Sucessful",
          duration: const Duration(seconds: 1),
        );
      } else {}
    }
  }

  void ontap() {
    _navigationService.replaceWithRegisterView();
  }
}
