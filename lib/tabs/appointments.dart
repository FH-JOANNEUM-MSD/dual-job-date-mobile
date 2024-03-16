import 'package:dual_job_date_mobile/data/mockCompanies.dart';
import 'package:dual_job_date_mobile/models/company.dart';
import 'package:dual_job_date_mobile/widgets/companies_dropdown.dart';
import 'package:flutter/material.dart';
import '../components/appointmentCard.dart';
import '../data/mockAppointments.dart';
import '../static_helpers/colors.dart';
import '../static_helpers/values.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_form_padding.dart';
import '../models/appointment.dart';

class Appointments extends StatefulWidget {
  const Appointments({super.key});

  @override
  State<Appointments> createState() => _AppointmentsState();
}

const double borderRadiusCard = 12;
const double heightCard = 65;
const double marginImage = 100;

class _AppointmentsState extends State<Appointments> {
  List<Appointment> appointmentsToShow =
      mockAppointments; // Change this based on your requirements

  final List<Company> _companies = mockCompanies;

  Company? selectedCompany;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            buildScreenTitle(),
            CompaniesDropDown(
              companies: _companies,
              onChanged: (value) {
                setState(() {
                  selectedCompany = value as Company?;
                });
              },
            ),
            buildSectionTitle(context),
            selectedCompany == null
                ? buildPlaceHolder()
                : buildAppointments(),
            Visibility(
              visible: selectedCompany != null,
              child: CustomFormPadding(
                topHeaderDistance: Values.paddingInsetButtonTop,
                childWidget: CustomElevatedButton(
                  text: "SPEICHERN",
                  onPressed: () {
                    // TODO Logic implenmentieren
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildScreenTitle() {
    return const Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10.0),
            child: Text(
              textAlign: TextAlign.left,
              "Terminvereinbarung",
              style: TextStyle(fontSize: 30.0),
            ),
          );
  }

  Padding buildSectionTitle(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: StaticColors.primary,
                    width: 2.5,
                  ),
                ),
              ),
              child: const Text(
                "Freie Termine",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          );
  }

  Padding buildPlaceHolder() {
    return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Text(
                      "Wählen Sie ein Unternehmen aus, "
                      "um freie Termine zu sehen",
                      style: TextStyle(fontSize: 24, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
  }

  Padding buildAppointments() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: appointmentsToShow.length,
        physics: const NeverScrollableScrollPhysics(),
        // disable scrolling
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2.4,
          crossAxisSpacing: 24.0,
          mainAxisSpacing: 24.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return AppointmentCard(appointment: appointmentsToShow[index]);
        },
      ),
    );
  }
}
