import 'package:boiler_plate/core/exceptions.dart';
import 'package:boiler_plate/environment.dart';
import 'package:boiler_plate/utils/logger.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  static const String TOP_HEADLINES = 'top-headlines';

  final Dio dio = Dio();

  ApiClient() {
    dio.options.baseUrl = Environment.value.baseUrl!;
    dio.options.connectTimeout = const Duration(minutes: 3);
    dio.options.receiveTimeout = const Duration(minutes: 3);
    if (Environment.value.environmentType != EnvType.PRODUCTION) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: false,
        ),
      );
    }
  }

  Future<Response<Map<String, dynamic>>> post(
    String path,
    dynamic data,
  ) async {
    try {
      return await dio.post(path, data: data);
    } on DioError catch (e) {
      Logger.write(e.message ?? "");
      throw ApiException(e.message ?? "");
    }
  }

  Future<Response<Map<String, dynamic>>> put(String path, dynamic data) async {
    try {
      return await dio.put(path, data: data);
    } on DioError catch (e) {
      Logger.write(e.message ?? "");
      throw ApiException(e.message ?? "");
    }
  }

  Future<Response<Map<String, dynamic>>> delete(String path) async {
    try {
      return await dio.delete(path);
    } on DioError catch (e) {
      Logger.write(e.message ?? "");
      throw ApiException(e.message ?? "");
    }
  }

  Future<Response<Map<String, dynamic>>> get(String path) async {
    try {
      return await dio.get(path);
    } on DioError catch (e) {
      Logger.write(e.message ?? "");
      throw ApiException(e.message ?? "");
    }
  }
}
