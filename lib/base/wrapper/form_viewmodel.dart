import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/services/firebase_auth_service.dart';
import 'package:whatsapp_stacked/services/firebase_database_service.dart';

abstract class FormViewmodelWrapper extends FormViewModel {
  final navigationService = locator<NavigationService>();
  final snackbarService = locator<SnackbarService>();
  final firebaseAuth = locator<FirebaseAuthService>();
  final firestoreService = locator<FirebaseDatabaseService>();
}
