import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked/ui/views/login/login_service.dart';
import 'package:whatsapp_stacked/ui/views/register/register_service.dart';
import 'package:whatsapp_stacked/services/token_storage_service.dart';
import 'package:whatsapp_stacked/services/fetch_user_service.dart';
import 'package:whatsapp_stacked/services/dio_service.dart';
import 'package:whatsapp_stacked/ui/views/login/repository/login_repository_implementation_service.dart';
import 'package:whatsapp_stacked/ui/views/register/repository/register_repository_implementation_service.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/service/fetch_messages_service.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/service/fetch_other_messages_service.dart';
import 'package:whatsapp_stacked/services/firebase_database_service.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/repository/fetch_other_messages/other_messages_repository_imp_service.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/repository/fetch_user_messages/user_messages_repository_imp_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LoginService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<RegisterService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<TokenStorageService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<FetchUserService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DioService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LoginRepositoryImplementationService>(
      onMissingStub: OnMissingStub.returnDefault),
  MockSpec<RegisterRepositoryImplementationService>(
      onMissingStub: OnMissingStub.returnDefault),
  MockSpec<FetchMessagesService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<FetchOtherMessagesService>(
      onMissingStub: OnMissingStub.returnDefault),
  MockSpec<FirebaseDatabaseService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<OtherMessagesRepositoryImpService>(
      onMissingStub: OnMissingStub.returnDefault),
  MockSpec<UserMessagesRepositoryImpService>(
      onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterLoginService();
  // getAndRegisterRegisterService();
  getAndRegisterTokenStorageService();
  getAndRegisterFetchUserService();
  getAndRegisterDioService();
  // getAndRegisterLoginRepositoryImplementationService();
  // getAndRegisterRegisterRepositoryImplementationService();
  getAndRegisterFetchMessagesService();
  getAndRegisterFetchOtherMessagesService();
  getAndRegisterFirebaseDatabaseService();
  getAndRegisterOtherMessagesRepositoryImpService();
  getAndRegisterUserMessagesRepositoryImpService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockLoginService getAndRegisterLoginService() {
  _removeRegistrationIfExists<LoginService>();
  final service = MockLoginService();
  locator.registerSingleton<LoginService>(service);
  return service;
}

// MockRegisterService getAndRegisterRegisterService() {
//   _removeRegistrationIfExists<RegisterService>();
//   final service = MockRegisterService();
//   locator.registerSingleton<RegisterService>(service);
//   return service;
// }

MockTokenStorageService getAndRegisterTokenStorageService() {
  _removeRegistrationIfExists<TokenStorageService>();
  final service = MockTokenStorageService();
  locator.registerSingleton<TokenStorageService>(service);
  return service;
}

MockFetchUserService getAndRegisterFetchUserService() {
  _removeRegistrationIfExists<FetchUserService>();
  final service = MockFetchUserService();
  locator.registerSingleton<FetchUserService>(service);
  return service;
}

MockDioService getAndRegisterDioService() {
  _removeRegistrationIfExists<DioService>();
  final service = MockDioService();
  locator.registerSingleton<DioService>(service);
  return service;
}

// MockLoginRepositoryImplementationService
//     getAndRegisterLoginRepositoryImplementationService() {
//   _removeRegistrationIfExists<LoginRepositoryImplementationService>();
//   final service = MockLoginRepositoryImplementationService();
//   locator.registerSingleton<LoginRepositoryImplementationService>(service);
//   return service;
// }

// MockRegisterRepositoryImplementationService
//     getAndRegisterRegisterRepositoryImplementationService() {
//   _removeRegistrationIfExists<RegisterRepositoryImplementationService>();
//   final service = MockRegisterRepositoryImplementationService();
//   locator.registerSingleton<RegisterRepositoryImplementationService>(service);
//   return service;
// }

MockFetchMessagesService getAndRegisterFetchMessagesService() {
  _removeRegistrationIfExists<FetchMessagesService>();
  final service = MockFetchMessagesService();
  locator.registerSingleton<FetchMessagesService>(service);
  return service;
}

MockFetchOtherMessagesService getAndRegisterFetchOtherMessagesService() {
  _removeRegistrationIfExists<FetchOtherMessagesService>();
  final service = MockFetchOtherMessagesService();
  locator.registerSingleton<FetchOtherMessagesService>(service);
  return service;
}

MockFirebaseDatabaseService getAndRegisterFirebaseDatabaseService() {
  _removeRegistrationIfExists<FirebaseDatabaseService>();
  final service = MockFirebaseDatabaseService();
  locator.registerSingleton<FirebaseDatabaseService>(service);
  return service;
}

MockOtherMessagesRepositoryImpService
    getAndRegisterOtherMessagesRepositoryImpService() {
  _removeRegistrationIfExists<OtherMessagesRepositoryImpService>();
  final service = MockOtherMessagesRepositoryImpService();
  locator.registerSingleton<OtherMessagesRepositoryImpService>(service);
  return service;
}

MockUserMessagesRepositoryImpService
    getAndRegisterUserMessagesRepositoryImpService() {
  _removeRegistrationIfExists<UserMessagesRepositoryImpService>();
  final service = MockUserMessagesRepositoryImpService();
  locator.registerSingleton<UserMessagesRepositoryImpService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
