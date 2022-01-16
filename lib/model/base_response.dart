import '../core/base/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse extends BaseModel{
  BaseResponse({
    this.data,
    this.status,
    this.message,
  });

  Object? data;
  bool? status;
  String? message;

  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);

  @override
  BaseResponse fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}