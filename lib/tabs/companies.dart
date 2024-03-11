import 'package:dual_job_date_mobile/data/mockCompanies.dart';
import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/companyCard.dart';

class Companies extends StatefulWidget {
  const Companies({super.key});

  @override
  State<Companies> createState() => _CompaniesState();
}

class _CompaniesState extends State<Companies> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Unternehmen',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  InkWell(
                    onTap: () {
                      print('filter');
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: SvgPicture.asset(
                      'assets/images/svg/filter.svg',
                      color: StaticColors.black,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ]),
          ),
        ),
        body: ListView.builder(
            itemCount: mockCompanies.length,
            itemBuilder: (context, index) {
              return CompanyCardWidget(
                company: mockCompanies[index],
              );
            }));
  }
}
