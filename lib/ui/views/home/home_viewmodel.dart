import 'package:flutter/material.dart';

import 'package:whatsapp_stacked/base/fetch_user/fetch_repository_implementation.dart';
import 'package:whatsapp_stacked/base/models/user.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  late UserData users = UserData(data: []);
  bool fetch = true;
  final fetchRepo = FetchRepositoryImplementation();
  void fetchUsers() async {
    if (fetch == true) {
      try {
        final fetchedUsers = await fetchRepo.fetchUsersToRepository();
        users = fetchedUsers;
        fetch = false;
        rebuildUi();
      } catch (error) {
        debugPrint('Error fetching data.');
      }
    }
  }
}
