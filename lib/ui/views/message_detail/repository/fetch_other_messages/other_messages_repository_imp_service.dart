import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/models/messages.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/repository/fetch_other_messages/fetch_other_messages_repository.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/service/fetch_other_messages_service.dart';

class OtherMessagesRepositoryImpService
    implements FetchOtherMessagesRepository {
  final _fetchMessages = locator<FetchOtherMessagesService>();
  List<Messages> usermessageList = [];

  @override
  Future<List<Messages>> fetchMessagesThroughRepo(uid) async {
    return usermessageList = await _fetchMessages.fetchMessages(uid);
  }
}
