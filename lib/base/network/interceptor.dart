import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/services/token_storage_service.dart';

class DioInterceptor extends Interceptor {
  Dio dio = Dio();
  final _tokenService = locator<TokenStorageService>();
  final _bottomSheetService = locator<BottomSheetService>();

  /// Add headers to requests, include token when token is not null in secure storage.
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({
      "Content-Type": "application/json",
    });
    final token = await _tokenService.getToken('token');
    if (token != null) {
      options.headers.addAll({
        "Authorization": "Bearer $token",
      });
    }

    return super.onRequest(options, handler);
  }

  /// Print status code after every api response.
  /// Save token to secure storage if response contains token.
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    String res = response.toString();
    if (res.contains("token")) {
      var login = jsonDecode(response.toString());
      await _tokenService.setToken('token', login['token']);
    }
    debugPrint(response.statusCode.toString());
    super.onResponse(response, handler);
  }

  /// Give feedback of type of error to user using snackbar.
  @override
  Future<void> onError(err, handler) async {
    debugPrint(err.toString());
    switch (err.response?.statusCode) {
      case 400:
        _bottomSheetService.showBottomSheet(title: "Bad Request");

      case 401:
        _bottomSheetService.showBottomSheet(title: "UnAuthorized");
      case 403:
        _bottomSheetService.showBottomSheet(title: "Forbidden");
      case 404:
        _bottomSheetService.showBottomSheet(title: "Not Found");
      case 429:
        _bottomSheetService.showBottomSheet(title: "Too Many Requests");
      case 502:
        _bottomSheetService.showBottomSheet(title: "Bad Gateway");
      case 504:
        _bottomSheetService.showBottomSheet(title: "Gateway Timeout");
      case 500:
        _bottomSheetService.showBottomSheet(title: "Internal Server Error");
    }
  }
}
