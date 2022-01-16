import '../constants/enum/network_enum.dart';

extension NetworkExtension on Network {
  String get value {
    switch(this) {
      case Network.LOGIN:
        return '/auth/login';
      case Network.PROFILE:
        return '/profile';
      case Network.PRODUCTS:
        return '/products/';
      case Network.ORDER:
        return '/order';
      default:
        return '';
    }
  }


}