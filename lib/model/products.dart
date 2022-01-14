import 'package:json_annotation/json_annotation.dart';
import 'package:smart_carboy/core/base/base_model.dart';
import 'link.dart';
import 'product.dart';

part 'products.g.dart';

@JsonSerializable()
class Products extends BaseModel {
  Products({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  @JsonKey(name: 'current_page')
  int? currentPage;
  List<Product>? data;
  @JsonKey(name: 'first_page_url')
  String? firstPageUrl;
  int? from;
  @JsonKey(name: 'last_page')
  int? lastPage;
  @JsonKey(name: 'last_page_urş')
  String? lastPageUrl;
  List<Link>? links;
  @JsonKey(name: 'next_page_url')
  dynamic nextPageUrl;
  String? path;
  @JsonKey(name: 'per_page')
  int? perPage;
  @JsonKey(name: 'prev_page_url')
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) => _$ProductsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}
