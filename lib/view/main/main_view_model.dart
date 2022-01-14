import 'package:flutter/src/widgets/framework.dart';
import 'package:smart_carboy/core/base/base_view_model.dart';
import 'package:smart_carboy/model/product.dart';
import 'package:smart_carboy/service/product_service.dart';

class MainViewModel extends CustomBaseViewModel {
  final ProductService _productService = ProductService.instance!;
  List<Product> productList = [];
  int _bottomBarIndex = 1;

  int get bottomBarIndex => _bottomBarIndex;

  set bottomBarIndex(int value) {
    _bottomBarIndex = value;
    notifyListeners();
  }

  @override
  void initialize(BuildContext context) {
    this.context = context;
    getProducts();
  }

  void getProducts() async {
    isLoading = true;
    var result = await _productService.getProducts();
    if (result != null) {
      productList = result.productList!.data!;
    }
    isLoading = false;
  }
}