import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/base/common/api_urls.dart';
import 'package:whatsapp_stacked/services/dio_service.dart';
import 'package:whatsapp_stacked/ui/views/login/models/login_request.dart';

class LoginService {
  final _dioService = locator<DioService>();

  Future loginApiRequest(LoginRequestModel loginRequestModel) async {
    final dio = _dioService.dio;

    final response = await dio.post((ApiUrls.login), data: loginRequestModel);

    return response;
  }
}
