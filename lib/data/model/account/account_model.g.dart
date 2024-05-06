// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) => AccountModel(
      id: json['id'] as String,
      username: json['username'] as String,
      phoneNumber: json['phoneNumber'] as String,
      point: (json['point'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'phoneNumber': instance.phoneNumber,
      'point': instance.point,
    };
