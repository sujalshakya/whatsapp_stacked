import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/services/login_service.dart';
import 'package:whatsapp_stacked/ui/views/login/repository/login_repository.dart';

interface class LoginRepositoryImplementation implements LoginRepository {
  final _loginservice = locator<LoginService>();
  @override
  Future<bool> login(String email, String password) async {
    try {
      bool response = await _loginservice.loginFirebase(email, password);

      return response;
    } catch (e) {
      return false;
    }
  }
}
