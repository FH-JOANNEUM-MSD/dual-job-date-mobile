import 'package:flutter/material.dart';
import '../components/appointmentCard.dart';
import '../data/mockAppointments.dart';
import '../static_helpers/colors.dart';
import '../static_helpers/values.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_form_padding.dart';
import '../models/appointment.dart';

class Appointments extends StatefulWidget {
  const Appointments({Key? key}) : super(key: key);

  @override
  State<Appointments> createState() => _AppointmentsState();
}

final double borderRadiusCard = 12;
final double heightCard = 65;
final double marginImage = 100;

class _AppointmentsState extends State<Appointments> {
  List<Appointment> appointmentsToShow =
      mockAppointments; // Change this based on your requirements

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            "Terminvereinbarung",
            style: TextStyle(fontSize: 30.0),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadiusCard),
              ),
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
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 19), //  need to have responsive values
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              "Firma xy",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Image.asset(
                              "assets/images/appointments/arrow_down_icon.png",
                              color: StaticColors.primary,
                              width: 22,
                              height: 22,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 50.0,
                bottom: 8.0,
                left: 20,
                right: 20,
              ),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: StaticColors.primary,
                    width: 2.5,
                  ),
                ),
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Freie Termine",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: appointmentsToShow.length,
                physics:
                    const NeverScrollableScrollPhysics(), // disable scrolling
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.4,
                  crossAxisSpacing: 24.0,
                  mainAxisSpacing: 24.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return AppointmentCard(
                      appointment: appointmentsToShow[index]);
                },
              ),
            ),
            CustomFormPadding(
              topHeaderDistance: Values.paddingInsetButtonTop,
              childWidget: CustomElevatedButton(
                text: "SPEICHERN",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
