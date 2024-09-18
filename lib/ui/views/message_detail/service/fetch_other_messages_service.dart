import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/services/firebase_auth_service.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/models/messages.dart';
import 'package:whatsapp_stacked/services/firebase_database_service.dart';

final _firestoreService = locator<FirebaseDatabaseService>();
final _firebaseAuth = locator<FirebaseAuthService>();

class FetchOtherMessagesService {
  Future<List<Messages>> fetchMessages(String uid) async {
    List<Messages> othermessageList = [];

    try {
      QuerySnapshot querySnapshot = await _firestoreService.db
          .collection("chats")
          .doc(uid)
          .collection(_firebaseAuth.firebaseAuth.currentUser!.uid)
          .orderBy("timestamp", descending: true)
          .get();

      for (var docSnapshot in querySnapshot.docs) {
        othermessageList.add(Messages(
            message: docSnapshot['message'],
            timestamp: docSnapshot['timestamp']));
      }
    } catch (e) {
      debugPrint("Error completing: $e");
      rethrow;
    }
    return othermessageList;
  }
}
