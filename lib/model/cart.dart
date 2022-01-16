import 'package:json_annotation/json_annotation.dart';
import '../core/base/base_model.dart';

import 'cart_item.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart extends BaseModel{
  Cart({
    this.cart,
    this.price,
  });

  List<CartItem>? cart;
  double? price;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CartToJson(this);
}


