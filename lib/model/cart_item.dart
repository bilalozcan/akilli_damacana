import 'package:json_annotation/json_annotation.dart';
import 'package:smart_carboy/core/base/base_model.dart';

part 'cart_item.g.dart';

@JsonSerializable()
class CartItem extends BaseModel {
  CartItem({
    this.id,
    this.count,
  });

  int? id;
  int? count;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}
