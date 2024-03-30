import 'package:dual_job_date_mobile/models/company.dart';
import 'package:dual_job_date_mobile/static_helpers/appstyles.dart';
import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:dual_job_date_mobile/static_helpers/values.dart';
import 'package:flutter/material.dart';

class DetailsCompany extends StatelessWidget {
  const DetailsCompany({super.key, required this.company});

  final Company company;
  final double gapText = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                width: Values.screenWidth,
                child: Image.asset(
                  'assets/images/companies/title_company.png',
                  fit: BoxFit.fitWidth,
                )),
            // todo: absolute button

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
                        Text(company.name, style: AppTextStyles.title),
                        SizedBox(height: gapText),
                        Text('${company.field}', style: AppTextStyles.title),
                        SizedBox(height: gapText),
                        Text('${company.likes} likes',
                            style: AppTextStyles.title)
                      ],
                    ),
                  ),
                  const Divider(
                    color: StaticColors.primary,
                    thickness: 2,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text('Beschreibung:',
                            style: AppTextStyles.heading),
                        SizedBox(
                          height: gapText - 6,
                        ),
                        Text(company.description,
                            style: AppTextStyles.description),
                      ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
