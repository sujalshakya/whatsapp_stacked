import 'package:whatsapp_stacked/ui/views/message_detail/models/messages.dart';

abstract class FetchMessagesRepository {
  Future<List<Messages>> fetchMessagesThroughRepo(String uid);
}
