import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../models/appointment.dart';
import '../static_helpers/colors.dart';
import '../tabs/appointments.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    Key? key,
    required this.appointment,
  }) : super(key: key);

  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd.MM.yyyy').format(appointment.date); // Format date
    final formattedTime = DateFormat('HH:mm').format(appointment.date); // Format time

    return Container(
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusCard),
        border: Border.all(
          color: StaticColors.primary,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            formattedDate, // Use formatted date
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            formattedTime, // Use formatted time
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}