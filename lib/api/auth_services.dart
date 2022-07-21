import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

import 'api_config.dart';

abstract class AuthRepo {
  factory AuthRepo(Dio dio) = _AuthServices;
  Future<dynamic> login(String body);
}

class _AuthServices implements AuthRepo {
  _AuthServices(this._dio);
  final Dio _dio;

  @override
  Future login(String doby) async {
    try {
      var res =
          await _dio.post(ApiConfig.login, data: jsonEncode({"EmpID": doby}));
      return res;
    } catch (e) {
      log("error api call login", error: e);
      return false;
    }
  }
}
