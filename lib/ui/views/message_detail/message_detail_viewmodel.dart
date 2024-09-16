import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/services/fetch_messages_service.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/message_detail_view.form.dart';

class MessageDetailViewModel extends FormViewModel with $MessageDetailView {
  final _firebaseAuth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final _messageService = locator<FetchMessagesService>();
  final String uid;
  List<Map<String, dynamic>> messages = [];

  MessageDetailViewModel({required this.uid});

  void fetchMessages() async {
    final fetchedMessages = await _messageService.fetchUsers(uid);
    messages = fetchedMessages;
    messages.sort;
    debugPrint(messages.toString());
    rebuildUi();
  }

  void addMessage() {
    if (messageController.text.isNotEmpty) {
      final message = <String, dynamic>{
        "message": messageController.text,
        "timestamp": FieldValue.serverTimestamp()
      };
      db
          .collection("chats")
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(uid)
          .doc()
          .set(message)
          .onError((e, _) => debugPrint("Error writing document: $e"));
      messageController.clear();
    }
    fetchMessages();
  }
}
