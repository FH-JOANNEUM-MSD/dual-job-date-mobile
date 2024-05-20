import 'package:dual_job_date_mobile/models/appointment.dart';
import 'mockCompanies.dart';

final List<Appointment> mockAppointments = [
  Appointment(date: DateTime(2025, 1, 1, 5, 45), company: mockCompanies[1]),
  Appointment(date: DateTime(2025, 1, 2, 6, 0), company: mockCompanies[1]),
  Appointment(date: DateTime(2025, 1, 3, 6, 15), company: mockCompanies[2]),
  Appointment(date: DateTime(2025, 1, 4, 6, 30), company: mockCompanies[3]),
  Appointment(date: DateTime(2025, 1, 5, 5, 45), company: mockCompanies[4]),
  Appointment(date: DateTime(2025, 1, 6, 6, 0), company: mockCompanies[0]),
];
