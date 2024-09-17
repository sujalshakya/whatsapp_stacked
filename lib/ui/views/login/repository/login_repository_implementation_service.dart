import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/ui/views/login/login_service.dart';
import 'package:whatsapp_stacked/ui/views/login/repository/login_repository.dart';

class LoginRepositoryImplementationService implements LoginRepository {
  final _loginservice = locator<LoginService>();
  @override
  Future<String> login(String email, String password) async {
    try {
      String response = await _loginservice.loginFirebase(email, password);

      return response;
    } catch (e) {
      return e.toString();
    }
  }
}
