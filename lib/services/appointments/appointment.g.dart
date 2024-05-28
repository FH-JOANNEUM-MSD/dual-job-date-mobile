// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
      id: json['id'] as int,
      appointmentDate: DateTime.parse(json['appointmentDate'] as String),
      userId: json['userId'] as String,
      companyId: json['companyId'] as String,
      company: json['company'] as String,
    );

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'appointmentDate': instance.appointmentDate.toIso8601String(),
      'userId': instance.userId,
      'companyId': instance.companyId,
      'company': instance.company,
    };
