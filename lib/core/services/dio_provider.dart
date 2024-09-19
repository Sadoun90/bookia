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

  static Future<Response> get(
      {required String endPoint, Map<String, dynamic>? headers}) {
    return dio.get(endPoint, options: Options(headers: headers));
  }

  static Future<Response> post(
      {required String endPoint,
      Map<String, dynamic>? data,
      Map<String, dynamic>? headers}) {
    return dio.post(endPoint, data: data, options: Options(headers: headers));
  }

  static Future<Response> put(
      {required String endPoint,
      Map<String, dynamic>? data,
      Map<String, dynamic>? headers}) {
    return dio.get(endPoint, data: data, options: Options(headers: headers));
  }

  static Future<Response> delete(
      {required String endPoint, Map<String, dynamic>? headers}) {
    return dio.get(endPoint, options: Options(headers: headers));
  }
}
