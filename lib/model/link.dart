import 'package:json_annotation/json_annotation.dart';
import 'package:smart_carboy/core/base/base_model.dart';

part 'link.g.dart';

@JsonSerializable()
class Link extends BaseModel {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LinkToJson(this);
}
