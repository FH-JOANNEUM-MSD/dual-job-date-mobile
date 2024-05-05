// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'more_user_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataResponse _$UserDataResponseFromJson(Map<String, dynamic> json) =>
    UserDataResponse(
      json['tokenType'] as String,
      json['accessToken'] as String,
      json['expiresIn'] as int,
      json['refreshToken'] as String,
      json['isNew'] as bool,
      json['statusCode'] as int,
    );

Map<String, dynamic> _$UserDataResponseToJson(UserDataResponse instance) =>
    <String, dynamic>{
      'tokenType': instance.tokenType,
      'accessToken': instance.accessToken,
      'expiresIn': instance.expiresIn,
      'refreshToken': instance.refreshToken,
      'isNew': instance.isNew,
      'statusCode': instance.statusCode,
    };
