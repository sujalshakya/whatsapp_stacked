import 'package:whatsapp_stacked/base/network/dio.dart';
import 'package:whatsapp_stacked/base/common/api_urls.dart';
import 'package:whatsapp_stacked/ui/views/login/models/login_request.dart';

class LoginService {
  Future loginApiRequest(LoginRequestModel loginRequestModel) async {
    final dio = DioInstance().dio;

    final response = await dio.post((ApiUrls.login), data: loginRequestModel);

    return response;
  }
}
