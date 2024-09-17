import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/models/messages.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/repository/fetch_user_messages/fetch_messages_repository.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/service/fetch_messages_service.dart';

class UserMessagesRepositoryImpService implements FetchMessagesRepository {
  final _fetchMessages = locator<FetchMessagesService>();
  List<Messages> usermessageList = [];

  @override
  Future<List<Messages>> fetchMessagesThroughRepo(uid) async {
    return usermessageList = await _fetchMessages.fetchMessages(uid);
  }
}
