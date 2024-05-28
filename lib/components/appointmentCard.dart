import 'package:dual_job_date_mobile/services/appointments/appointment.dart';
import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../services/companies/company.dart';

//TODO check if reaction is null in parent widget
// handle reaction correctly in this widget

class AppointmentCard extends StatefulWidget {
  const AppointmentCard({super.key, required this.appointment});

  final Appointment appointment;

  @override
  State<AppointmentCard> createState() => _CustomAppointmentCardState();
}

class _CustomAppointmentCardState extends State<AppointmentCard> {
  final double borderRadiusCard = 12;

  final double heightCard = 80;

  final double marginImage = 4;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String date_day = DateFormat('yyyy-MM-dd').format(widget.appointment.date);
    String date_time = DateFormat('HH:mm').format(widget.appointment.date);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusCard),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadiusCard),
        child: Container(
          height: heightCard,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadiusCard),
            border: Border.all(
              color: StaticColors.primary,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: marginImage,
                  horizontal: marginImage,
                ),
                width: (heightCard - 2 * marginImage)+50,
                child: Center(
                  child: Text(
                    widget.appointment.company,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(date_day.toString() ?? '',
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w800)),
                      Text(date_time.toString() ?? '',
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w800)),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
