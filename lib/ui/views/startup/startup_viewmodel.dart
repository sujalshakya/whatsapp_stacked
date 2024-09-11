import 'package:stacked/stacked.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked/services/token_storage_service.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _tokenService = locator<TokenStorageService>();

  /// Navigates after a delay of 1 second
  /// to login or home depending on token.
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 1));
    final token = await _tokenService.getToken('token');
    if (token == null) {
      _navigationService.replaceWithLoginView();
    } else {
      _navigationService.replaceWithHomeView();
    }
  }
}
