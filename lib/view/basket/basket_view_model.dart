import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_carboy/core/base/base_view_model.dart';
import 'package:smart_carboy/model/cart.dart';
import 'package:smart_carboy/model/cart_item.dart';
import 'package:smart_carboy/model/product.dart';
import 'package:smart_carboy/service/product_service.dart';

class BasketViewModel extends CustomBaseViewModel {
  final ProductService _productService = ProductService.instance!;
  List<Product> basketList = [];
  double _totalCount = 0.0;
  bool _isSuccess = false;

  bool get isSuccess => _isSuccess;

  set isSuccess(bool value) {
    _isSuccess = value;
    notifyListeners();
  }

  double get totalCount => _totalCount;

  set totalCount(double value) {
    _totalCount = value;
  }

  @override
  void initialize(BuildContext context) {
    // TODO: implement initialize
  }

  void basketUpdate(Product product, bool isAdd) {
    var containsIndex =
        basketList.indexWhere((element) => product.id == element.id);
    if (containsIndex != -1) {
      if (isAdd) {
        basketList[containsIndex].count += 1;
      } else {
        if (basketList[containsIndex].count == 1) {
          basketList.removeAt(containsIndex);
        } else {
          basketList[containsIndex].count -= 1;
        }
      }
    } else {
      product.count += 1;
      basketList.add(product);
    }
    updateTotalCount();
    notifyListeners();
  }

  void updateTotalCount() {
    double temp = 0;
    basketList.forEach((element) {
      temp += element.count * element.price!;
    });
    totalCount = temp;
  }

  void postOrder() async {
    if (basketList.isNotEmpty) {
      isLoading = true;
      try {
        final cart = Cart(
            price: totalCount,
            cart: basketList
                .map((basketItem) =>
                    CartItem(id: basketItem.id, count: basketItem.count))
                .toList());
        var result = await _productService.postOrder(cart);
        print('aaa');
        if (result != null) {
          Fluttertoast.showToast(msg: 'Siparişiniz Alındı');
          basketList.clear();
          isSuccess = true;
          // notifyListeners();
        } else {
          Fluttertoast.showToast(
              msg: 'Siparişiniziz alınırken bir hata oluştu!');
        }
      } catch (e) {
      } finally {
        isLoading = false;
      }
    } else {
      Fluttertoast.showToast(msg: 'Sepet Boş!');
    }
  }
}
