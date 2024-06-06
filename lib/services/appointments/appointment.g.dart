// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
      json['id'] as int,
      DateTime.parse(json['startTime'] as String),
      DateTime.parse(json['endTime'] as String),
      json['userId'] as String,
      User.fromJson(json['user'] as Map<String, dynamic>),
      json['companyId'] as String,
      Company.fromJson(json['company'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'userId': instance.userId,
      'user': instance.user,
      'companyId': instance.companyId,
      'company': instance.company,
    };
