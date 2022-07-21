import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:newproject/api/api_config.dart';

abstract class ProductRepo {
  factory ProductRepo(Dio dio) = _ProductServices;
  Future<dynamic> getProduct();
}

class _ProductServices implements ProductRepo {
  _ProductServices(this._dio);
  final Dio _dio;

  @override
  Future getProduct() async {
    try {
      var res = await _dio.get(ApiConfig.getProduct);
      return res;
    } catch (e) {
      log("error while calling getproduct api", error: e);
      return false;
    }
  }
}
