import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/ui/views/register/register_service.dart';
import 'package:whatsapp_stacked/ui/views/register/repository/register_repository.dart';

interface class RegisterRepositoryImp implements RegisterRepository {
  final _registerservice = locator<RegisterService>();
  @override
  Future<String> register(String email, String password) async {
    try {
      return await _registerservice.registerFirebase(email, password);
    } catch (e) {
      return e.toString();
    }
  }
}
