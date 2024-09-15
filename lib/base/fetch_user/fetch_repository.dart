import 'package:whatsapp_stacked/base/models/user.dart';

abstract class FetchRepository {
  Future<UserData> fetchUsersToRepository();
}
