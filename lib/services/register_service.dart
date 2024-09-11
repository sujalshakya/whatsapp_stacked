import 'package:whatsapp_stacked/base/network/dio.dart';
import 'package:whatsapp_stacked/ui/common/api_urls.dart';
import 'package:whatsapp_stacked/ui/views/register/models/register_request_model.dart';

class RegisterService {
  Future registerApiRequest(RegisterRequest registerRequest) async {
    final dio = DioInstance().dio;

    final response = await dio.post(
      (ApiUrls.signup),
      data: registerRequest,
    );

    return response;
  }
}
