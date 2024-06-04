import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/appointmentCard.dart';
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
  }

  Future<void> refresh() async {
    BlocProvider.of<AppointmentsBloc>(context).add(AppointmentsFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Termine',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ]),
          ),
        ),
        body: BlocBuilder<AppointmentsBloc, AppointmentsState>(
          builder: (context, state) {
            if (state.status == AppointmentsStatus.LOADING) {
              return const Center(
                // todo: change loading indicator
                child: CircularProgressIndicator(),
              );
            } else if (state.status == AppointmentsStatus.LOADED) {
              if (state.appointments.length > 0) {
                return RefreshIndicator(
                  onRefresh: refresh,
                  child: ListView.builder(
                    itemCount: state.appointments.length,
                    itemBuilder: (context, index) {
                      return AppointmentCard(
                        appointment: state.appointments[index],
                      );
                    },
                  ),
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Keine Termine vorhanden"),
                      IconButton(onPressed: refresh, icon: Icon(Icons.refresh))
                    ],
                  ),
                );
              }
            } else if (state.status == AppointmentsStatus.INITIAL) {
              BlocProvider.of<AppointmentsBloc>(context)
                  .add(AppointmentsFetchEvent());
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error loading appointments'),
                    IconButton(onPressed: refresh, icon: Icon(Icons.refresh))
                  ],
                ),
              );
            }
          },
        ));
  }
}
