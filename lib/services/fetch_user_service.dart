import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final db = FirebaseFirestore.instance;

class FetchUserService {
  Future<List<Map<String, dynamic>>> fetchUsers() async {
    List<Map<String, dynamic>> userList = [];

    try {
      QuerySnapshot querySnapshot = await db.collection("users").get();

      for (var docSnapshot in querySnapshot.docs) {
        Map<String, dynamic> userData =
            docSnapshot.data() as Map<String, dynamic>;
        userList.add(userData);
      }
    } catch (e) {
      debugPrint("Error completing: $e");
    }

    return userList;
  }
}
