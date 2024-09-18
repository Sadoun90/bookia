import 'package:dio/dio.dart';
import 'package:bookia/core/constants/constants.dart';

class DioProvider {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));
  }

  static Future<Response> get({required String endPoint}) {
    return dio.get(endPoint);
  }

  static Future<Response> post(
      {required String endPoint, Map<String, dynamic>? data}) {
    return dio.post(endPoint, data: data);
  }
}
