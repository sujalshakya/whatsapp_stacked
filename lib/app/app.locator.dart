// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/fetch_user_service.dart';
import '../services/login_service.dart';
import '../services/register_service.dart';
import '../services/token_storage_service.dart';

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
}
