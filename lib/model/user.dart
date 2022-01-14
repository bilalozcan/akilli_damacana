import 'package:json_annotation/json_annotation.dart';
import 'package:smart_carboy/core/base/base_model.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends BaseModel{
  User({
    this.id,
    this.name,
    this.surname,
    this.phoneNumber,
    this.email,
    this.username,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.profilePicture,
    this.height,
    this.weight,
    this.age,
  });

  String? id;
  String? name;
  String? surname;
  String? phoneNumber;
  String? email;
  String? username;
  @JsonKey(name: 'email_verified_at')
  DateTime? emailVerifiedAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'profile_picture')
  String? profilePicture;
  int? height;
  int? weight;
  int? age;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
