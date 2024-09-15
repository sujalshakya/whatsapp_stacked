import 'package:flutter/material.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';

import 'package:whatsapp_stacked/base/fetch_user/fetch_repository.dart';
import 'package:whatsapp_stacked/base/models/user.dart';
import 'package:whatsapp_stacked/services/fetch_user_service.dart';

/// Convert Api data to list of user datas.

interface class FetchRepositoryImplementation implements FetchRepository {
  final _fetchService = locator<FetchUserService>();
  @override
  Future<UserData> fetchUsersToRepository() async {
    try {
      final response = await _fetchService.fetchUsersApiCall();
      return UserData.fromJson(response.data);
    } catch (e) {
      debugPrint(e.toString());
      throw 'No User!';
    }
  }
}
