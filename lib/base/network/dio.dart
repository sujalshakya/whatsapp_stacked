import 'package:dio/dio.dart';
import 'package:whatsapp_stacked/base/network/interceptor.dart';

class DioInstance {
  Dio dio = Dio(BaseOptions(connectTimeout: const Duration(milliseconds: 3600)))
    ..interceptors.addAll([LogInterceptor(), DioInterceptor()]);
}
