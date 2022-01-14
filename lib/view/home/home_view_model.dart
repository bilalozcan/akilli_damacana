import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:smart_carboy/core/base/base_view_model.dart';
import 'package:smart_carboy/model/product.dart';
import 'package:smart_carboy/service/product_service.dart';
import 'package:smart_carboy/view/basket/basket_view_model.dart';

class HomeViewModel extends CustomBaseViewModel {
  final ProductService _productService = ProductService.instance!;
  List<Product> productList = [];

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
      productList.forEach((product) {
        var basketItem = context
            .read<BasketViewModel>()
            .basketList
            .firstWhere((basketItem) => product.id == basketItem.id, orElse: (){
              return Product();
        });
        if(basketItem.id != null){
          product.count = basketItem.count;
        }

      });
    }
    isLoading = false;
  }
}
