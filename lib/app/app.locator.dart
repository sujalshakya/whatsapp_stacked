// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/dio_service.dart';
import '../ui/views/message_detail/service/fetch_messages_service.dart';
import '../ui/views/message_detail/service/fetch_other_messages_service.dart';
import '../services/fetch_user_service.dart';
import '../services/firebase_database_service.dart';
import '../services/token_storage_service.dart';
import '../ui/views/login/login_service.dart';
import '../ui/views/login/repository/login_repository_implementation_service.dart';
import '../ui/views/register/register_service.dart';
import '../ui/views/register/repository/register_repository_implementation_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => LoginService());
  locator.registerLazySingleton(() => RegisterService());
  locator.registerLazySingleton(() => TokenStorageService());
  locator.registerLazySingleton(() => FetchUserService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => DioService());
  locator.registerLazySingleton(() => LoginRepositoryImplementationService());
  locator
      .registerLazySingleton(() => RegisterRepositoryImplementationService());
  locator.registerLazySingleton(() => FetchMessagesService());
  locator.registerLazySingleton(() => FetchOtherMessagesService());
  locator.registerLazySingleton(() => FirebaseDatabaseService());
}
