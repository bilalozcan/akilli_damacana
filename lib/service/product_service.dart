import '../core/constants/enum/network_enum.dart';
import '../core/extensions/network_extension.dart';
import '../core/init/network/network_manager.dart';
import '../model/auth_response.dart';
import '../model/cart.dart';
import '../model/empty.dart';
import '../model/product_response.dart';

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
