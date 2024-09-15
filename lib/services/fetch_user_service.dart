import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/base/common/api_urls.dart';
import 'package:whatsapp_stacked/services/dio_service.dart';

class FetchUserService {
  final _dioService = locator<DioService>();

  fetchUsersApiCall() async {
    final dio = _dioService.dio;

    return await dio.get((ApiUrls.fetch));
  }
}
