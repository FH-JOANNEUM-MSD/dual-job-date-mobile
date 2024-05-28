import 'package:json_annotation/json_annotation.dart';

part 'appointment.g.dart';

@JsonSerializable()
class Appointment {
  final int id;
  final DateTime appointmentDate;
  final String userId;
  final String companyId;
  final String company;

  Appointment({
    required this.id,
    required this.appointmentDate,
    required this.userId,
    required this.companyId,
    required this.company,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) => _$AppointmentFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}
