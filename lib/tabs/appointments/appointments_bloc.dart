import 'package:bloc/bloc.dart';
import 'package:dual_job_date_mobile/services/appointments/appointments_service.dart';
import 'appointments_event.dart';
import 'appointments_state.dart';

class AppointmentsBloc extends Bloc<AppointmentsEvent, AppointmentsState> {
  AppointmentsBloc() : super(AppointmentsInitialState ()) {
    on<AppointmentsFetchEvent>((event, emit) async {
      emit(AppointmentsStateLoading());

      var appointments= await AppointmentsService.getAppointments();
      if (appointments != null) {
        emit(AppointmentsStateLoaded(appointments));
      } else {
        emit(AppointmentsStateError());
      }
    });
  }
}
