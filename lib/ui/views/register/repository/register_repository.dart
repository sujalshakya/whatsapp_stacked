import 'package:whatsapp_stacked/ui/views/register/models/register_request_model.dart';

abstract class RegisterRepository {
  Future<bool> register(RegisterRequest registerRequest);
}
