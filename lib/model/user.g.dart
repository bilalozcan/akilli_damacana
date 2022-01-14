// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      emailVerifiedAt: json['emailVerifiedAt'] == null
          ? null
          : DateTime.parse(json['emailVerifiedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      profilePicture: json['profilePicture'] as String?,
      height: json['height'] as int?,
      weight: json['weight'] as int?,
      age: json['age'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'username': instance.username,
      'emailVerifiedAt': instance.emailVerifiedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'profilePicture': instance.profilePicture,
      'height': instance.height,
      'weight': instance.weight,
      'age': instance.age,
    };
