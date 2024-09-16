import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final db = FirebaseFirestore.instance;
final _firebaseAuth = FirebaseAuth.instance;

class FetchMessagesService {
  Future<List<Map<String, dynamic>>> fetchUsers(String uid) async {
    List<Map<String, dynamic>> messageList = [];

    try {
      QuerySnapshot querySnapshot = await db
          .collection("chats")
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(uid)
          .get();

      for (var docSnapshot in querySnapshot.docs) {
        Map<String, dynamic> userData =
            docSnapshot.data() as Map<String, dynamic>;
        messageList.add(userData);
      }
    } catch (e) {
      debugPrint("Error completing: $e");
    }

    return messageList;
  }
}
