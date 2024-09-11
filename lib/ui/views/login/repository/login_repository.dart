import 'package:whatsapp_stacked/ui/views/login/models/login_request.dart';

abstract class LoginRepository {
  Future<bool> login(LoginRequestModel loginRequestModel);
}
