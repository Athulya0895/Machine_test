import 'package:dio/dio.dart';
import 'package:newproject/models/product.dart';

import '../../base/base_view_model.dart';

class HomePageVM extends BaseViewModel {
  @override
  void onInit() {
    getProductlist();
  }

  List<Product> productList = [];
  getProductlist() async {
    showLoading();
    final res = await api.productRepo.getProduct();
    hideLoading();
    if (res.runtimeType == Response) {
      if (res != false) {
        final List data = res.data as List;

        productList = data.map((e) => Product.fromjson(e)).toList();
      } else {
        showError("error");
      }
    }
  }
}
