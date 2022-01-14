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
      emailVerifiedAt: json['email_verified_at'] == null
          ? null
          : DateTime.parse(json['email_verified_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      profilePicture: json['profile_picture'] as String?,
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
      'email_verified_at': instance.emailVerifiedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'profile_picture': instance.profilePicture,
      'height': instance.height,
      'weight': instance.weight,
      'age': instance.age,
    };
