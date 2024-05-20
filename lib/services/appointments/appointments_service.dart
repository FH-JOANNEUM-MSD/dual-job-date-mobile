import '../../data/mockAppointments.dart';
import '../../models/appointment.dart';

class AppointmentsService {
  static Future<List<Appointment>> getAppointments() async {
    return mockAppointments;
  }

}
