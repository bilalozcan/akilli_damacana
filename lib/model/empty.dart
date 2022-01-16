import 'package:json_annotation/json_annotation.dart';
import '../core/base/base_model.dart';

part 'empty.g.dart';

@JsonSerializable()
class Empty extends BaseModel {
  Empty();

  factory Empty.fromJson(Map<String, dynamic> json) => _$EmptyFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) => _$EmptyFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EmptyToJson(this);

}