import 'dart:math';

import 'package:bookia/core/constants/constants.dart';
import 'package:bookia/features/auth/data/models/request/register_params.dart';
import 'package:bookia/features/auth/data/models/response/login_response/login_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthRepo {
  //How to call Api ?
  // the main packages are (Dio , http)
  // 1) parse baseUrl+endpoint from String to Uri (not in Dio)
  // 2) call Api with specified methods(get or post or put or delete)
  // 3) check statuscode (200 0k) and other failures
  // 4) convert response body from string to json (jsonDecode) (not in Dio)
  // 5) if 200 => parse json response to model and return it
  // 6) handle failure
  static Future<LoginResponse?> register(RegisterParams params) async {
    Uri url = Uri.parse(AppConstants.baseUrl + AppConstants.registerEndpoints);
    var response = await http.post(url, body: params.toJson());

    if (response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);
      var model = LoginResponse.fromJson(jsonResponse);
      return model;
    } else {
      return null;
    }
  }

  static Future<LoginResponse?> login(
      {required String email, required String password}) async {
    Uri url = Uri.parse(AppConstants.baseUrl + AppConstants.loginEndpoints);
    var response = await http.post(url, body: {
      "email": email,
      "password": password,
    });

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var model = LoginResponse.fromJson(jsonResponse);
      return model;
    } else {
      return null;
    }
  }
}
