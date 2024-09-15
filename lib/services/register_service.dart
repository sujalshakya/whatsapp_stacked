import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/base/common/api_urls.dart';
import 'package:whatsapp_stacked/services/dio_service.dart';
import 'package:whatsapp_stacked/ui/views/register/models/register_request_model.dart';

class RegisterService {
  final _dioService = locator<DioService>();

  Future registerApiRequest(RegisterRequest registerRequest) async {
    final dio = _dioService.dio;

    final response = await dio.post(
      (ApiUrls.signup),
      data: registerRequest,
    );

    return response;
  }
}
