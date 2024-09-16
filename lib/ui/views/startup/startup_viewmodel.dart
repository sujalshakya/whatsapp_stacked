import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _firebaseAuth = FirebaseAuth.instance;

  /// Navigates after a delay of 1 second
  /// to login or home depending on token.
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 1));
    if (_firebaseAuth.currentUser?.uid == null) {
      _navigationService.replaceWithLoginView();
    } else {
      _navigationService.replaceWithHomeView();
    }
  }
}
