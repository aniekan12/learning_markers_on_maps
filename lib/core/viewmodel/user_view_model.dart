import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learningmarkersonmaps/core/model/user_model.dart';
import 'package:learningmarkersonmaps/core/services/api_handler/base_dio.dart';
import 'package:learningmarkersonmaps/core/services/api_handler/user_api.dart';

class UserViewModel extends ChangeNotifier {
  //save the data from the endpoint in this list
  List<User> userList = [];

  Future getUsersAndDisplay() async {
    try {
      Response response = await UserApi.getUsers();
      if (response.statusCode == 200) {
        userList.addAll(List<User>.from(
            response.data.map((users) => User.fromJson(users))));
      }
    } on DioError catch (e) {
      BaseDio.debugDioError(error: e);
    }
  }
}
