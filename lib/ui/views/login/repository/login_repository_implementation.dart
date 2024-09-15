import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/services/login_service.dart';
import 'package:whatsapp_stacked/services/token_storage_service.dart';
import 'package:whatsapp_stacked/ui/views/login/repository/login_repository.dart';

interface class LoginRepositoryImplementation implements LoginRepository {
  final _tokenService = locator<TokenStorageService>();
  final _firebaseAuth = FirebaseAuth.instance;
  final _loginservice = locator<LoginService>();
  @override
  Future<String?> login(String email, String password) async {
    try {
      await _loginservice.loginFirebase(email, password);
      String token = _firebaseAuth.currentUser!.uid;
      await _tokenService.setToken('token', token);
      return token;
    } catch (e) {
      return null;
    }
  }
}
