import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/services/token_storage_service.dart';

class DioInterceptor extends Interceptor {
  Dio dio = Dio();
  final _tokenService = locator<TokenStorageService>();
  final _snackbarService = locator<SnackbarService>();

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
    switch (err.response?.statusCode) {
      case 400:
        _snackbarService.showSnackbar(
            message: 'Bad Request', duration: const Duration(seconds: 2));
      case 401:
        _snackbarService.showSnackbar(
            message: 'UnAuthorized', duration: const Duration(seconds: 2));
      case 403:
        _snackbarService.showSnackbar(
            message: 'Forbidden', duration: const Duration(seconds: 2));
      case 404:
        _snackbarService.showSnackbar(
            message: 'Not Found', duration: const Duration(seconds: 2));
      case 429:
        _snackbarService.showSnackbar(
            message: 'Too Many Requests', duration: const Duration(seconds: 2));
      case 502:
        _snackbarService.showSnackbar(
            message: 'Bad Gateway', duration: const Duration(seconds: 2));
      case 504:
        _snackbarService.showSnackbar(
            message: 'Gateway Timeout', duration: const Duration(seconds: 2));
      case 500:
        _snackbarService.showSnackbar(
            message: 'Internal Server Error',
            duration: const Duration(seconds: 2));
    }
  }
}
