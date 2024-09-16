import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/message_detail_view.form.dart';

class MessageDetailViewModel extends FormViewModel with $MessageDetailView {
  final _firebaseAuth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  List<String> messages = [
    "Hello how are you?",
    "I am fine. What about you?",
    "I am great as well."
  ];

  void addMessage() {
    if (messageController.text.isNotEmpty) {
      final message = <String, String>{
        "message": messageController.text,
        "Send to": "uid"
      };
      db
          .collection("chats")
          .doc(_firebaseAuth.currentUser!.uid)
          .collection("messages")
          .doc()
          .set(message)
          .onError((e, _) => debugPrint("Error writing document: $e"));
      messageController.clear();
    }
  }
}
