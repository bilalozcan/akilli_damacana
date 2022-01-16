import 'package:json_annotation/json_annotation.dart';
import '../core/base/base_model.dart';
import 'user.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile extends BaseModel {
  Profile({this.user});
  User? user;
  @override
  fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProfileToJson(this);


}