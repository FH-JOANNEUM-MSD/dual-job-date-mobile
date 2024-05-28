import 'package:json_annotation/json_annotation.dart';

part 'appointment.g.dart';

@JsonSerializable()
class Appointment {
  final int id;
  final String userId;
  final DateTime date;
  final String company;

  Appointment({
    required this.id,
    required this.userId,
    required this.date,
    required this.company,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) => _$AppointmentFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}
