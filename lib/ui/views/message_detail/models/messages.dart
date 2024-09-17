import 'package:cloud_firestore/cloud_firestore.dart';

class Messages {
  Messages({
    this.message,
    this.timestamp,
  });
  String? message;
  Timestamp? timestamp;

  @override
  int get hashCode => Object.hash(message, timestamp);

  toJson() {
    return {
      "message": message,
      "timestamp": timestamp,
    };
  }

  @override
  bool operator ==(Object other) =>
      other is Messages &&
      other.message == message &&
      other.timestamp == timestamp;
}
