import 'package:dual_job_date_mobile/data/mockCompanies.dart';
import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:dual_job_date_mobile/static_helpers/strings.dart';
import 'package:dual_job_date_mobile/widgets/swipe_ui/card_provider.dart';
import 'package:dual_job_date_mobile/widgets/swipe_ui/custom_card_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../components/companyCard.dart';

class Companies extends StatefulWidget {
  const Companies({super.key});

  @override
  State<Companies> createState() => _CompaniesState();
}

class _CompaniesState extends State<Companies> {
  void _openFilterCompaniesModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('Filter Companies'),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close'),
                    )
                  ],
                ),
              ),
              Positioned(
                  top: 50,
                  right: 20,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ))
            ],
          ),
        );
      },
    );
  }

  //Consumer<CardProvider>(
  // builder: (BuildContext context, CardProvider value, Widget? child) {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    CompaniesScreenStrings.title,
                    style: TextStyle(fontSize: 30.0),
                  ),
                  InkWell(
                    onTap: () => _openFilterCompaniesModal(context),
                    borderRadius: BorderRadius.circular(12),
                    child: SvgPicture.asset(
                      CompaniesScreenStrings.filterIconPath,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ]),
          ),
        ),
        body: Consumer<CardProvider>(
            builder: (BuildContext context, CardProvider value, Widget? child) {
          return ListView.builder(
              itemCount: mockCompanies.length,
              itemBuilder: (context, index) {
                return CompanyCardWidget(
                  company: mockCompanies[index],
                );
              });
        }));
  }
}
