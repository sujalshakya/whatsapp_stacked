import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/services/firebase_auth_service.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/models/messages.dart';
import 'package:whatsapp_stacked/services/firebase_database_service.dart';

final _firestoreService = locator<FirebaseDatabaseService>();
final _firebaseAuth = locator<FirebaseAuthService>();

class FetchMessagesService {
  Future<List<Messages>> fetchMessages(String uid) async {
    List<Messages> usermessageList = [];

    try {
      QuerySnapshot querySnapshot = await _firestoreService.db
          .collection("chats")
          .doc(_firebaseAuth.firebaseAuth.currentUser!.uid)
          .collection(uid)
          .get();

      for (var docSnapshot in querySnapshot.docs) {
        usermessageList.add(Messages(
            message: docSnapshot['message'],
            timestamp: docSnapshot['timestamp']));
      }
    } catch (e) {
      debugPrint("Error completing: $e");
    }

    return usermessageList;
  }
}
