// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(
        Map<String, dynamic> json, int statusCode) =>
    LoginResponse(
        json['tokenType'] as String,
        json['accessToken'] as String,
        json['expiresIn'] as int,
        json['refreshToken'] as String,
        json['isNew'] as bool,
        statusCode);

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'tokenType': instance.tokenType,
      'accessToken': instance.accessToken,
      'expiresIn': instance.expiresIn,
      'refreshToken': instance.refreshToken,
      'isNew': instance.isNew,
    };
