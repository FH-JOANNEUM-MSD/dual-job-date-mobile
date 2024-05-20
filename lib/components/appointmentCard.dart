import 'dart:convert';

import 'package:dual_job_date_mobile/screens/details_company.dart';
import 'package:flutter/material.dart';
import '../models/appointment.dart';
import '../static_helpers/colors.dart';

class CompanyCardWidget extends StatelessWidget {
  const CompanyCardWidget({
    super.key,
    required this.appointment,
  });

  final Appointment appointment;

  final double borderRadiusCard = 12;
  final double heightCard = 80;
  final double marginImage = 4;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusCard),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadiusCard),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsCompany(company: appointment.company),
              ));
        },
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
              Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: marginImage, horizontal: marginImage),
                      width: heightCard - 2 * marginImage,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          alignment: Alignment.center,
                          fit: BoxFit.fill,
                          image: Image.memory(
                            base64Decode(appointment.company.logoBase64!),
                          ).image,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 0, bottom: 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(appointment.company.name ?? '',
                            style: const TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w500)),
                        Text(
                          appointment.company.industry ?? '',
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
