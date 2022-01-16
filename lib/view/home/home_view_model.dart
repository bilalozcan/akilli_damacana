import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import '../../core/base/base_view_model.dart';
import '../../model/product.dart';
import '../../service/product_service.dart';
import '../basket/basket_view_model.dart';

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
