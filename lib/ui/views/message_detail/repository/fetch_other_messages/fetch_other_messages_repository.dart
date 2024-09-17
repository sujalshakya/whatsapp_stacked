import 'package:whatsapp_stacked/ui/views/message_detail/models/messages.dart';

abstract class FetchOtherMessagesRepository {
  Future<List<Messages>> fetchMessagesThroughRepo(String uid);
}
