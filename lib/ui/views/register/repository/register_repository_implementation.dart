import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/services/register_service.dart';
import 'package:whatsapp_stacked/ui/views/register/repository/register_repository.dart';

interface class RegisterRepositoryImplementation implements RegisterRepository {
  final _registerservice = locator<RegisterService>();
  @override
  Future<bool> register(String email, String password) async {
    try {
      return await _registerservice.registerFirebase(email, password);
    } catch (e) {
      return false;
    }
  }
}
