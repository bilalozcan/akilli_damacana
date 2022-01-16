import 'package:json_annotation/json_annotation.dart';
import '../core/base/base_model.dart';
import 'user.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse extends BaseModel{
  AuthResponse({this.user, this.token});

  User? user;
  String? token;

  @override
  fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}