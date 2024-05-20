import '../models/appointment.dart';
import 'mockCompanies.dart';

final List<Appointment> mockAppointments = [
  Appointment(date: DateTime(2025, 1, 1, 5, 45), company: mockCompanies[1]),
  Appointment(date: DateTime(2025, 1, 3, 6, 15), company: mockCompanies[0]),
];