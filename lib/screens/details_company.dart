import 'dart:convert';

import 'package:dual_job_date_mobile/static_helpers/appstyles.dart';
import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:dual_job_date_mobile/static_helpers/values.dart';
import 'package:dual_job_date_mobile/widgets/custom_back_button_circle.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
                            Row(
                              children: [
                                showInfo("Unternehmen: "),
                                showInfo(company.name ?? 'Keine Angaben'),
                              ],
                            ),
                            Row(
                              children: [
                                showInfo("Branche: "),
                                showInfo(company.industry ?? 'Keine Angaben'),
                              ],
                            ),
                            Row(
                              children: [
                                showInfo("Webseite: "),
                                showInfo(company.website ?? 'Keine Angaben'),
                              ],
                            ),
                            Row(
                              children: [
                                showInfo("Webseite: "),
                                company.addresses != null ? showInfo(
                                    company.addresses!.first.street!) :
                                showInfo("Keine Angaben")
                              ],
                            ),
                            Row(
                              children: [
                                showInfo("Adresse: "),
                                showInfo(getAddress(company))
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

  showInfo(String info) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Text(info, style: AppTextStyles.title),
    );
  }

  String getAddress(Company company) {
    if (company.addresses != null && company.addresses!.length > 0) {
      var address = company.addresses!.first;
      String? street;
      String? buildingNumber;
      address.street != null ?
      street = address.street : street = null;
      address.buildingNumber != null ?
      buildingNumber = address.buildingNumber : buildingNumber = null;

     if (street != null && buildingNumber != null)
        return street + " " + buildingNumber;
    }
    return "Keine Angaben";
  }
}
