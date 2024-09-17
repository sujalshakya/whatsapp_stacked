import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:whatsapp_stacked/base/models/user.dart';
import 'package:whatsapp_stacked/services/fetch_user_service.dart';

class ContactViewModel extends BaseViewModel {
  List<User> users = [];
  final _fetchUsers = FetchUserService();
  bool fetch = true;

  fetchUsers() async {
    if (fetch == true) {
      setBusy(true);
      try {
        final fetchedUsers = await _fetchUsers.fetchUsers();
        users = fetchedUsers;
        fetch = false;
        setBusy(false);
        rebuildUi();
      } catch (error) {
        debugPrint(error.toString());
      }
    }
  }
}
