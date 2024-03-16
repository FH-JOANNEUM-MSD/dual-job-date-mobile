import '../models/appointment.dart';

final List<Appointment> mockAppointments = [
  Appointment(date: DateTime(2025, 1, 1, 5, 45)),
  Appointment(date: DateTime(2025, 1, 2, 6, 0)),
  Appointment(date: DateTime(2025, 1, 3, 6, 15)),
  Appointment(date: DateTime(2025, 1, 4, 6, 30)),
  Appointment(date: DateTime(2025, 1, 1, 5, 45)),
  Appointment(date: DateTime(2025, 1, 2, 6, 0)),
];

final List<Appointment> mockMatchAppointments = [
  Appointment(date: DateTime(2025, 1, 1, 5, 45)),
  Appointment(date: DateTime(2025, 1, 2, 6, 0)),
  Appointment(date: DateTime(2025, 1, 3, 6, 15)),
];
