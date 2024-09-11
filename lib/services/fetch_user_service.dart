import 'package:whatsapp_stacked/base/network/dio.dart';
import 'package:whatsapp_stacked/base/common/api_urls.dart';

class FetchUserService {
  fetchUsersApiCall() async {
    final dio = DioInstance().dio;

    return await dio.get((ApiUrls.fetch));
  }
}
