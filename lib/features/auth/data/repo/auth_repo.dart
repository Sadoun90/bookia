import 'dart:math';

import 'package:bookia/core/constants/constants.dart';
import 'package:bookia/core/services/dio_provider.dart';
import 'package:bookia/features/auth/data/models/request/register_params.dart';
import 'package:bookia/features/auth/data/models/response/login_response/login_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'dart:convert';

class AuthRepo {
  //How to call Api ?
  // the main packages are (Dio , http)
  // 2) call Api with specified methods(get or post or put or delete)
  // 3) check statuscode (200 0k) and other failures
  // 5) if 200 => parse json response to model and return it
  // 6) handle failure
  static Future<LoginResponse?> register(RegisterParams params) async {
    var response = await DioProvider.post(
        endPoint: AppConstants.registerEndpoints, data: params.toJson());

    if (response.statusCode == 201) {
      var model = LoginResponse.fromJson(response.data);
      return model;
    } else {
      return null;
    }
  }

  static Future<LoginResponse?> login(
      {required String email, required String password}) async {
    print("Sending request with email: $email and password: $password");
    try {
      var response = await DioProvider.post(
        endPoint: AppConstants.loginEndpoints,
        data: {"email": email, "password": password},
      );
      print("Response status: ${response.statusCode}");
      print("Response data: ${response.data}");

      // Check if status code is 200
      if (response.statusCode == 200) {
        print("Login successful");
        return LoginResponse.fromJson(response.data);
      } else {
        print("Login failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Exception during login: $e");
      return null;
    }
  }
}
