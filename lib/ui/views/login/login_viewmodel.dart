import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/app/app.router.dart';
import 'package:whatsapp_stacked/base/wrapper/form_viewmodel.dart';
import 'package:whatsapp_stacked/ui/views/login/login_view.form.dart';
import 'package:whatsapp_stacked/ui/views/login/repository/login_repository_implementation_service.dart';

class LoginViewModel extends FormViewmodelWrapper with $LoginView {
  final _loginrepo = locator<LoginRepositoryImp>();

  void loginFirebase() async {
    if (!hasAnyValidationMessage) {
      final login =
          await _loginrepo.login(emailController.text, passwordController.text);
      if (login == "true") {
        navigationService.replaceWithHomeView();
        snackbarService.showSnackbar(
          message: "Login Sucessful",
          duration: const Duration(seconds: 1),
        );
      } else {
        snackbarService.showSnackbar(
          message: login,
          duration: const Duration(seconds: 1),
        );
      }
    }
  }

  void ontap() {
    navigationService.replaceWithRegisterView();
  }
}
