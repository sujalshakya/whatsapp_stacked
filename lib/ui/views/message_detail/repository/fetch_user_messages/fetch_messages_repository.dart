abstract class FetchMessagesRepository {
  Future<List<Map<String, dynamic>>> fetchMessagesThroughRepo(String uid);
}
