
import 'package:dual_job_date_mobile/services/appointments/appointment.dart';

enum AppointmentsStatus {
  INITIAL,
  LOADING,
  LOADED,
  ERROR,
}

abstract class AppointmentsState {
  late AppointmentsStatus status;
  late List<Appointment> appointments;
}

class AppointmentsInitialState extends AppointmentsState {
  get status => AppointmentsStatus.INITIAL;

  get appointments => [];
}

class AppointmentsStateLoading extends AppointmentsState {
  get status => AppointmentsStatus.LOADING;
}

class AppointmentsStateLoaded extends AppointmentsState {
  AppointmentsStateLoaded(this.appointments);

  final List<Appointment> appointments;

  get status => AppointmentsStatus.LOADED;
}

class AppointmentsStateError extends AppointmentsState {
  get status => AppointmentsStatus.ERROR;
}
