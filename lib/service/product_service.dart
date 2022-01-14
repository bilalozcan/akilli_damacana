import 'package:smart_carboy/core/constants/enum/network_enum.dart';
import 'package:smart_carboy/core/extensions/network_extension.dart';
import 'package:smart_carboy/core/init/network/network_manager.dart';
import 'package:smart_carboy/model/auth_response.dart';
import 'package:smart_carboy/model/cart.dart';
import 'package:smart_carboy/model/empty.dart';
import 'package:smart_carboy/model/product_response.dart';

class ProductService {
  static ProductService? _instance;

  static ProductService? get instance {
    _instance ??= ProductService._init();
    return _instance;
  }

  ProductService._init();

  final NetworkManager _networkManager = NetworkManager.instance!;

  Future<ProductResponse> getProducts() async =>
      await _networkManager.get(Network.PRODUCTS.value, ProductResponse());

  Future<ProductResponse> getProduct(String productId) async =>
      await _networkManager.get(
          Network.PRODUCTS.value + productId, ProductResponse());

  Future<List<Empty>> postOrder(Cart cart) async =>
      await _networkManager.post(Network.ORDER.value, cart, Empty());
}
