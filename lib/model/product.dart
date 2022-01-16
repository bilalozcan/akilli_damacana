import 'package:json_annotation/json_annotation.dart';
import '../core/base/base_model.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends BaseModel{
  Product({
    this.id,
    this.brand,
    this.price,
    this.photoUrl,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? brand;
  double? price;
  @JsonKey(name: 'photo_url')
  String? photoUrl;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(ignore: true)
  int count = 0;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
