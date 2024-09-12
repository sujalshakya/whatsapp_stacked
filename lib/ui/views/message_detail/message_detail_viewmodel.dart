import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:whatsapp_stacked/base/fetch_user/fetch_repository_implementation.dart';
import 'package:whatsapp_stacked/base/models/user.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/message_detail_view.form.dart';

class MessageDetailViewModel extends FormViewModel with $MessageDetailView {
  List<String> messages = [
    "Hello how are you?",
    "I am fine. What about you?",
    "I am great as well."
  ];

  void addMessage() {
    if (messageController.text.isNotEmpty) {
      messages.add(messageController.text);
      messageController.clear();
    }
    rebuildUi();
  }

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
