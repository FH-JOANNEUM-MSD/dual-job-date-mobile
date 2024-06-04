import 'package:json_annotation/json_annotation.dart';

part 'appointment.g.dart';

@JsonSerializable()
class Appointment {
  final int id;
  final DateTime startTime;
  final DateTime endTime;
  final String userId;
  final String student;
  final String companyId;
  final String company;

  Appointment({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.userId,
    required this.student,
    required this.companyId,
    required this.company,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) => _$AppointmentFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}
