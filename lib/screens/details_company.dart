import 'dart:convert';
import 'package:dual_job_date_mobile/static_helpers/appstyles.dart';
import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:dual_job_date_mobile/static_helpers/values.dart';
import 'package:dual_job_date_mobile/widgets/custom_back_button_circle.dart';
import 'package:flutter/material.dart';
import '../services/companies/company.dart';
import '../static_helpers/strings.dart';

class DetailsCompany extends StatelessWidget {
  const DetailsCompany({super.key, required this.company});

  final Company company;
  final double gapText = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: Values.screenWidth,
                  child: company.companyDetails?.teamPictureBase64 != null
                      ? Image.memory(
                          base64Decode(
                              company.companyDetails!.teamPictureBase64!),
                          fit: BoxFit.fitWidth,
                        )
                      : Image.asset(
                          "assets/images/companies/placeholder-image.jpg"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Values.paddingHorizontalScreen,
                      vertical: Values.paddingVerticalScreen),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            showInfoHeading("Unternehmen"),
                            showInfo(company.name ?? 'Keine Angaben'),
                            showInfoHeading("Branche"),
                            showInfo(company.industry ?? 'Keine Angaben'),
                            Row(
                              children: [
                                showInfoHeading("Tätigkeiten "),
                                Text(
                                  "(1 - 5 nach Relevanz bewertet)",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w100,
                                      color: Colors.grey),
                                )
                              ],
                            ),
                            showInfo(showActivites(company)),
                            showInfoHeading("Ansprechpartner"),
                            showInfo(showContactPerson()),
                            showInfoHeading("Webseite"),
                            Row(
                              children: [
                                Flexible(
                                  child: showInfo(
                                      company.website ?? 'Keine Angaben'),
                                ),
                              ],
                            ),
                            showInfoHeading("Adresse"),
                            Row(
                              children: [
                                showAddress(),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: StaticColors.primary,
                        thickness: 2,
                        height: 24,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text('${DetailsCompanyStrings.description}:',
                                style: AppTextStyles.heading),
                            SizedBox(
                              height: gapText - 6,
                            ),
                            Text(company.companyDetails?.shortDescription ?? '',
                                style: AppTextStyles.description),
                          ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const CustomBackButtonCircle(),
        ],
      ),
    );
  }

  String showContactPerson() {
    if (company.companyDetails != null)
      return company.companyDetails!.contactPersonHRM ?? "Keine Angaben";
    return "Keine Angaben";
  }

  Widget showAddress() {
    if (company.companyDetails != null)
      return Flexible(child: showInfo(company.companyDetails!.addresses ?? ''));
    else
      return showInfo("Keine Angaben");
  }

  showInfo(String info) {
    return Text(info, style: AppTextStyles.description);
  }

  showInfoHeading(String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Text(info, style: AppTextStyles.heading),
    );
  }

  String showActivites(Company company) {
    String activites = "";
    if (company.activities != null) {
      company.activities!.sort((b, a) => a.value.compareTo(b.value));
      company.activities!.forEach((element) {
        activites += '${element.value} ${element.name}\n';
      });
      return activites;
    }
    return "Keine Angabe";
  }
}
