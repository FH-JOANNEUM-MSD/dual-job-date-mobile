import 'dart:convert';

import 'package:dual_job_date_mobile/services/HttpHelper.dart';
import 'package:dual_job_date_mobile/services/appointments/appointment.dart';

class AppointmentsService {
  static String getAppointmentsEndpoint = "Util/AppointmentsByUserId";


  static Future<List<Appointment>?> getAppointments() async {
    try {
      var response = await HTTPHelper.get(getAppointmentsEndpoint);
      if (response!.statusCode == 200) {
        List<dynamic> jsonList = json.decode(response.body);
        List<Appointment> companies =
        jsonList.map((json) => Appointment.fromJson(json)).toList();
        return companies;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

}