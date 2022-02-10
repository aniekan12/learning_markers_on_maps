// ignore_for_file: avoid_single_cascade_in_expression_statements, curly_braces_in_flow_control_structures

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:learningmarkersonmaps/utils/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class BaseDio {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: apiBaseUrl,
    headers: {"Content-Type": "application/json", "Accept": "application/json"},
  ));

  static Dio copyDio() {
    // interceptors only available in debug mode
    // creating a new copy this way because of pass by reference
    Dio newDio = Dio(BaseOptions(
        baseUrl: _dio.options.baseUrl, headers: _dio.options.headers));
    if (kDebugMode)
      newDio..interceptors.add(PrettyDioLogger(requestBody: true));
    return newDio;
  }

  // To prevent multiple instances in memory when it's not needed
  static Dio get getExistingDio {
    if (kDebugMode && _dio.interceptors.isEmpty)
      _dio..interceptors.add(PrettyDioLogger(requestBody: true));
    return _dio;
  }

  static Dio dioCopyAppendBasePath({@required String? path}) {
    Dio _dio = copyDio();
    _dio..options.baseUrl += path!;
    return _dio;
  }

  static void debugDioError({@required DioError? error}) {
    // for logging purposes
    if (kDebugMode)
      debugPrint(
          "Dio error response: ${error!.response}, message: ${error.message}, type: ${error.type}");
  }
}
