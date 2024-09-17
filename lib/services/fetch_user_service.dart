import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/base/models/user.dart';
import 'package:whatsapp_stacked/services/firebase_database_service.dart';

final _firestoreService = locator<FirebaseDatabaseService>();

class FetchUserService {
  Future<List<User>> fetchUsers() async {
    List<User> userList = [];

    try {
      QuerySnapshot querySnapshot =
          await _firestoreService.db.collection("users").get();

      for (var docSnapshot in querySnapshot.docs) {
        userList.add(User(
            name: docSnapshot['name'],
            email: docSnapshot['email'],
            uid: docSnapshot['Uid']));
      }
    } catch (e) {
      debugPrint("Error completing: $e");
    }

    return userList;
  }
}
