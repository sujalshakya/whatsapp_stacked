import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/services/firebase_auth_service.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/models/messages.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/repository/fetch_other_messages/other_messages_repository_imp_service.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/repository/fetch_user_messages/user_messages_repository_imp_service.dart';
import 'package:whatsapp_stacked/services/firebase_database_service.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/message_detail_view.form.dart';

class MessageDetailViewModel extends FormViewModel with $MessageDetailView {
  final _firebaseAuth = locator<FirebaseAuthService>();
  final _messageRepository = locator<UserMessagesRepositoryImp>();
  final _otherMessageRepository = locator<OtherMessagesRepositoryImp>();
  final _firestoreService = locator<FirebaseDatabaseService>();
  final String uid;
  List<Messages> userMessages = [];
  List<Messages> otherMessages = [];
  List<Messages> allMessages = [];

  /// Initialize as false.
  bool sameList = false;
  MessageDetailViewModel({required this.uid});

  void fetchMessages() async {
    setBusy(true);
    final fetchedMessages =
        await _messageRepository.fetchMessagesThroughRepo(uid);
    userMessages = fetchedMessages;
    final fetchMessages =
        await _otherMessageRepository.fetchMessagesThroughRepo(uid);
    otherMessages = fetchMessages;

    allMessages = userMessages + otherMessages;
    allMessages.sort(((a, b) {
      Timestamp? one = a.timestamp;
      Timestamp? two = b.timestamp;
      return two!.compareTo(one!);
    }));
    sameList = listEquals<Messages>(userMessages, otherMessages);

    debugPrint(sameList.toString());
    setBusy(false);
    rebuildUi();
  }

  /// Store message in firestore.
  void addMessage() {
    if (messageController.text.isNotEmpty) {
      final message = <String, dynamic>{
        "message": messageController.text,
        "timestamp": DateTime.now()
      };
      _firestoreService.db
          .collection("chats")
          .doc(_firebaseAuth.firebaseAuth.currentUser!.uid)
          .collection(uid)
          .doc()
          .set(message)
          .onError((e, _) => debugPrint("Error writing document: $e"));
      messageController.clear();
      fetchMessages();
      rebuildUi();
    }
  }
}
