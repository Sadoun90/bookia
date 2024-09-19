import 'dart:math';

import 'package:bookia/core/constants/constants.dart';
import 'package:bookia/core/services/dio_provider.dart';
import 'package:bookia/core/services/local_storage.dart';
import 'package:bookia/features/auth/data/models/request/register_params.dart';
import 'package:bookia/features/auth/data/models/response/get_wishlist_response/get_wishlist_response.dart';
import 'package:bookia/features/auth/data/models/response/login_response/login_response.dart';
import 'package:bookia/features/home/data/models/response/best_seller_response/best_seller_response.dart';
import 'package:bookia/features/home/data/models/response/get_cart_response/get_cart_response.dart';
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

  static Future<bool?> addToWishlist({required int productId}) async {
    var response = await DioProvider.post(
        endPoint: AppConstants.addToWishlistEndpoints,
        data: {
          "product_id": productId,
        },
        headers: {
          'Authorization':
              "Bearer ${LocalStorage.getData(key: LocalStorage.token)}"
        });

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool?> removeFromWishlist({required int productId}) async {
    var response = await DioProvider.post(
        endPoint: AppConstants.removeFromWishlistEndpoints,
        data: {
          "product_id": productId,
        },
        headers: {
          'Authorization':
              "Bearer ${LocalStorage.getData(key: LocalStorage.token)}"
        });

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<GetWishlistResponse?> getWishlist() async {
    var response = await DioProvider.get(
        endPoint: AppConstants.getWishlistEndpoints,
        headers: {
          'Authorization':
              "Bearer ${LocalStorage.getData(key: LocalStorage.token)}"
        });

    if (response.statusCode == 200) {
      var model = GetWishlistResponse.fromJson(response.data);
      return model;
    } else {
      return null;
    }
  }

  // cart
  static Future<bool?> addToCart({required int productId}) async {
    var response = await DioProvider.post(
        endPoint: AppConstants.addToCartEndpoints,
        data: {
          "product_id": productId,
        },
        headers: {
          'Authorization':
              "Bearer ${LocalStorage.getData(key: LocalStorage.token)}"
        });

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool?> removeFromCart({required int CartId}) async {
    var response = await DioProvider.post(
        endPoint: AppConstants.removeFromCartEndpoints,
        data: {
          "cart_item_id": CartId,
        },
        headers: {
          'Authorization':
              "Bearer ${LocalStorage.getData(key: LocalStorage.token)}"
        });

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<GetCartResponse?> getCart() async {
    var response = await DioProvider.get(
        endPoint: AppConstants.getCartEndpoints,
        headers: {
          'Authorization':
              "Bearer ${LocalStorage.getData(key: LocalStorage.token)}"
        });

    if (response.statusCode == 200) {
      var model = GetCartResponse.fromJson(response.data);
      return model;
    } else {
      return null;
    }
  }
}
