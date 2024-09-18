import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/base/models/user.dart';
import 'package:whatsapp_stacked/ui/views/home/repository/fetch_users_repository_imp_service.dart';

class HomeViewModel extends BaseViewModel {
  List<User> users = [];
  final _fetchUsers = locator<FetchUsersRepositoryImpService>();
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
