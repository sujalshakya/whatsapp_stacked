import 'package:whatsapp_stacked/base/models/user.dart';

abstract class FetchUserRepositoty {
  Future<List<User>> fetchUsers();
}
