import 'dart:math';

import 'package:bookia/core/constants/constants.dart';
import 'package:bookia/core/services/dio_provider.dart';
import 'package:bookia/features/auth/data/models/request/register_params.dart';
import 'package:bookia/features/auth/data/models/response/login_response/login_response.dart';
import 'package:bookia/features/home/data/models/response/best_seller_response/best_seller_response.dart';
import 'package:bookia/features/home/data/models/response/home_bunner_response/home_bunner_response.dart';
import 'package:bookia/features/home/presentation/bloc/bloc/home_bloc.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  static Future<BestSellerResponse?> getBestSellerBooks() async {
    var response =
        await DioProvider.get(endPoint: AppConstants.bestSellerBooksEndpoints);

    if (response.statusCode == 200) {
      var model = BestSellerResponse.fromJson(response.data);
      return model;
    } else {
      return null;
    }
  }

  // ignore: non_constant_identifier_names
  static Future<HomeBunnerResponse?> GetHomeBunner() async {
    var response =
        await DioProvider.get(endPoint: AppConstants.homeBunnerEndpoints);

    if (response.statusCode == 200) {
      var model = HomeBunnerResponse.fromJson(response.data);
      return model;
    } else {
      return null;
    }
  }
}
