import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_stacked/base/service/secure_storage.dart';

class DioInterceptor extends Interceptor {
  Dio dio = Dio();

  /// Add headers to requests, include token when token is not null in secure storage.
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({
      "Content-Type": "application/json",
    });
    final token = await SecureStorage().getToken('token');
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
      await SecureStorage().setToken('token', login['token']);
    }
    debugPrint(response.statusCode.toString());
    super.onResponse(response, handler);
  }

  /// Give feedback of type of error to user using snackbar.
  @override
  Future<void> onError(err, handler) async {
    debugPrint(err.toString());
    switch (err.response?.statusCode) {
      // case 400:
      //   SnackBarService.showSnackBar(content: "Bad Request");
      // case 401:
      //   SnackBarService.showSnackBar(content: "UnAuthorized");
      // case 403:
      //   SnackBarService.showSnackBar(content: "Forbidden");
      // case 404:
      //   SnackBarService.showSnackBar(content: "Not Found");
      // case 429:
      //   SnackBarService.showSnackBar(content: "Too Many Requests");
      // case 502:
      //   SnackBarService.showSnackBar(content: "Bad Gateway");
      // case 504:
      //   SnackBarService.showSnackBar(content: "UnAuthorized");
      // case 500:
      //   SnackBarService.showSnackBar(content: "Internal Server Error");
    }
  }
}
