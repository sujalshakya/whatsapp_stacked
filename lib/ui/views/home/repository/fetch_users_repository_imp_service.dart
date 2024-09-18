import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/base/models/user.dart';
import 'package:whatsapp_stacked/ui/views/home/service/fetch_user_service.dart';

final _usersService = locator<FetchUserService>();

class FetchUsersRepositoryImpService {
  Future<List<User>> fetchUsers() async {
    return await _usersService.fetchUsers();
  }
}
