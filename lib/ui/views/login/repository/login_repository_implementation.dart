import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/services/login_service.dart';
import 'package:whatsapp_stacked/ui/views/login/models/login_request.dart';
import 'package:whatsapp_stacked/ui/views/login/repository/login_repository.dart';

interface class LoginRepositoryImplementation implements LoginRepository {
  final _loginservice = locator<LoginService>();
  @override
  Future<bool> login(LoginRequestModel loginRequestModel) async {
    try {
      await _loginservice.loginApiRequest(loginRequestModel);

      return true;
    } catch (e) {
      return false;
    }
  }
}
