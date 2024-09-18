import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/models/messages.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/repository/fetch_other_messages/fetch_other_messages_repository.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/service/fetch_other_messages_service.dart';

class OtherMessagesRepositoryImp implements FetchOtherMessagesRepository {
  final _fetchMessages = locator<FetchOtherMessagesService>();

  @override
  Future<List<Messages>> fetchMessagesThroughRepo(uid) async {
    try {
      return await _fetchMessages.fetchMessages(uid);
    } catch (e) {
      throw e.toString();
    }
  }
}
