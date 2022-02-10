import 'package:dio/dio.dart';
import 'package:learningmarkersonmaps/core/services/api_handler/base_dio.dart';
import 'package:learningmarkersonmaps/utils/constants.dart';

class UserApi {
  static final Dio _dio = BaseDio.getExistingDio;

  static Future getUsers() {
    return _dio.get(displayUsersEndpoint);
  }
}
