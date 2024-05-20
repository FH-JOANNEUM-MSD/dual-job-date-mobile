import 'package:dual_job_date_mobile/static_helpers/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/appointmentCard.dart';
import '../../widgets/swipe_ui/custom_animated_swipe_card.dart';
import 'appointments_bloc.dart';
import 'appointments_event.dart';
import 'appointments_state.dart';

class Appointments extends StatefulWidget {
  const Appointments({super.key});

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AppointmentsBloc>(context).add(AppointmentsFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppointmentsStrings.title),
      ),
        body: BlocProvider(
          create: (context) => AppointmentsBloc(),
          child: BlocBuilder<AppointmentsBloc, AppointmentsState>(
            builder: (context, state) {
              if (state.status == AppointmentsStatus.LOADING) {
                return const Center(
                  // todo: change loading indicator
                  child: CircularProgressIndicator(),
                );
              } else if (state.status == AppointmentsStatus.LOADED) {
                return ListView.builder(
                  itemCount: state.appointments.length,
                  itemBuilder: (context, index) {
                    return CustomAnimatedSwipeCard(
                      company: state.appointments[index].company,
                    );
                  },
                );
              } else if (state.status == AppointmentsStatus.INITIAL) {
                BlocProvider.of<AppointmentsBloc>(context)
                    .add(AppointmentsFetchEvent());
                return const Center(
                  // todo: change loading indicator
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: Text('Error loading companies'),
                  // todo: reload button, triggern.
                  // onclick ->
                  //   BlocProvider.of<CompaniesBloc>(context)
                  //       .add(CompaniesFetchEvent());
                );
              }
            },
          ),
        ));
  }
}
