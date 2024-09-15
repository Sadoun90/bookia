import 'dart:math';

import 'package:bookia/core/constants/constants.dart';
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
    String url = AppConstants.baseUrl + AppConstants.registerEndpoints;
    var response = await Dio().post(url, data: params.toJson());

    if (response.statusCode == 201) {
      var model = LoginResponse.fromJson(response.data);
      return model;
    } else {
      return null;
    }
  }

  static Future<LoginResponse?> login(
      {required String email, required String password}) async {
    String url = AppConstants.baseUrl + AppConstants.loginEndpoints;
    var response = await Dio().post(url, data: {
      "email": email,
      "password": password,
    });

    if (response.statusCode == 200) {
      var model = LoginResponse.fromJson(response.data);
      return model;
    } else {
      return null;
    }
  }
}
