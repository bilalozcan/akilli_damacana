import 'package:json_annotation/json_annotation.dart';
import 'package:smart_carboy/core/base/base_model.dart';
import 'package:smart_carboy/model/product.dart';
import 'products.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse extends BaseModel {
  ProductResponse({
    this.product,
    this.productList,
  });

  Product? product;
  @JsonKey(name: 'products')
  Products? productList;

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) => _$ProductResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
