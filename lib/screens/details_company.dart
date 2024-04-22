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
                    child: Image.asset(
                      'assets/images/companies/title_company.png',
                      fit: BoxFit.fitWidth,
                    )),
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
                            Text(company.name ?? '', style: AppTextStyles.title),
                            SizedBox(height: gapText),
                            Text(company.industry ?? '',
                                style: AppTextStyles.title),
                            SizedBox(height: gapText),
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
}
