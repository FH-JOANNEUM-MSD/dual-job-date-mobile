import 'package:dual_job_date_mobile/services/companies/company.dart';
import 'package:json_annotation/json_annotation.dart';

part 'appointment.g.dart';

@JsonSerializable()
class Appointment {
  final int id;
  final DateTime startTime;
  final DateTime endTime;
  final String userId;
  final User user;
  final String companyId;
  final Company company;

  Appointment(this.id, this.startTime, this.endTime, this.userId, this.user,
      this.companyId, this.company);

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}
