// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'more_user_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataResponse _$UserDataResponseFromJson(Map<String, dynamic> json) =>
    UserDataResponse(
      json['firstName'] as String,
      json['lastName'] as String,
      json['email'] as String,
      json['statusCode'] as int,
    );

Map<String, dynamic> _$UserDataResponseToJson(UserDataResponse instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'statusCode': instance.statusCode,
    };
