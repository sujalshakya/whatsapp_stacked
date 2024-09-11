import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/services/register_service.dart';
import 'package:whatsapp_stacked/ui/views/register/models/register_request_model.dart';
import 'package:whatsapp_stacked/ui/views/register/repository/register_repository.dart';

interface class RegisterRepositoryImplementation implements RegisterRepository {
  final _registerservice = locator<RegisterService>();

  @override
  Future<bool> register(RegisterRequest registerRequest) async {
    try {
      final response =
          await _registerservice.registerApiRequest(registerRequest);

      final responseData = jsonDecode(response.toString());
      debugPrint(responseData.toString());
      return true;
    } catch (e) {
      return false;
    }
  }
}
