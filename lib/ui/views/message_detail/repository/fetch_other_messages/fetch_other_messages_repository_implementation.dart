import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/repository/fetch_other_messages/fetch_other_messages_repository.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/service/fetch_other_messages_service.dart';

class FetchOtherMessagesRepositoryImplementation
    implements FetchOtherMessagesRepository {
  final _fetchMessages = locator<FetchOtherMessagesService>();
  List<Map<String, dynamic>> usermessageList = [];

  @override
  Future<List<Map<String, dynamic>>> fetchMessagesThroughRepo(uid) async {
    return usermessageList = await _fetchMessages.fetchMessages(uid);
  }
}
