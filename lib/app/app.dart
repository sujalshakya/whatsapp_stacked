import 'package:whatsapp_stacked/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:whatsapp_stacked/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:whatsapp_stacked/ui/views/home/home_view.dart';
import 'package:whatsapp_stacked/ui/views/login/login_service.dart';
import 'package:whatsapp_stacked/ui/views/register/register_service.dart';
import 'package:whatsapp_stacked/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked/ui/views/contact/contact_view.dart';
import 'package:whatsapp_stacked/ui/views/login/login_view.dart';
import 'package:whatsapp_stacked/ui/views/register/register_view.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/message_detail_view.dart';
import 'package:whatsapp_stacked/services/token_storage_service.dart';
import 'package:whatsapp_stacked/ui/views/home/service/fetch_user_service.dart';
import 'package:whatsapp_stacked/ui/views/login/repository/login_repository_implementation_service.dart';
import 'package:whatsapp_stacked/ui/views/register/repository/register_repository_implementation_service.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/service/fetch_messages_service.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/service/fetch_other_messages_service.dart';
import 'package:whatsapp_stacked/services/firebase_database_service.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/repository/fetch_other_messages/other_messages_repository_imp_service.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/repository/fetch_user_messages/user_messages_repository_imp_service.dart';
import 'package:whatsapp_stacked/services/firebase_auth_service.dart';
import 'package:whatsapp_stacked/ui/views/home/repository/fetch_users_repository_imp_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: ContactView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: MessageDetailView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: LoginService),
    LazySingleton(classType: RegisterService),
    LazySingleton(classType: TokenStorageService),
    LazySingleton(classType: FetchUserService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: LoginRepositoryImp),
    LazySingleton(classType: RegisterRepositoryImp),
    LazySingleton(classType: FetchMessagesService),
    LazySingleton(classType: FetchOtherMessagesService),
    LazySingleton(classType: FirebaseDatabaseService),
    LazySingleton(classType: OtherMessagesRepositoryImp),
    LazySingleton(classType: UserMessagesRepositoryImp),
    LazySingleton(classType: FirebaseAuthService),
    LazySingleton(classType: FetchUsersRepositoryImp),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
