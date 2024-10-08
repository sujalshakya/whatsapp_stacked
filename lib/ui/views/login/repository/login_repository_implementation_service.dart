import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/ui/views/login/login_service.dart';
import 'package:whatsapp_stacked/ui/views/login/repository/login_repository.dart';

class LoginRepositoryImp implements LoginRepository {
  final _loginservice = locator<LoginService>();
  @override
  Future<String> login(String email, String password) async {
    try {
      return await _loginservice.loginFirebase(email, password);
    } catch (e) {
      return e.toString();
    }
  }
}
