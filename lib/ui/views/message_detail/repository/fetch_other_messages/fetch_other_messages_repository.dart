abstract class FetchOtherMessagesRepository {
  Future<List<Map<String, dynamic>>> fetchMessagesThroughRepo(String uid);
}
