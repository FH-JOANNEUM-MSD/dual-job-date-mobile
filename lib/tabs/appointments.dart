import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../static_helpers/colors.dart';
import '../static_helpers/strings.dart';

import 'package:flutter/material.dart';

class Appointments extends StatefulWidget {
  const Appointments({super.key});

  @override
  State<Appointments> createState() => _AppointmentsState();
}

final double borderRadiusCard = 12;
final double heightCard = 65;
final double marginImage = 100;

class _AppointmentsState extends State<Appointments> {
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
                        padding: EdgeInsets.only(left: 16.0, top: 0, bottom: 0),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                "Firma xy",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(12),
                                child: SvgPicture.asset(
                                  CompaniesScreenStrings.filterIconPath,
                                  color: StaticColors.black,
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 8.0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: StaticColors.primary,
                    width: 1,
                  ),
                ),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "FOO",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5, // Example number of items
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: heightCard,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(borderRadiusCard),
                            border: Border.all(
                              color: StaticColors.primary,
                              width: 1,
                            ),
                          ),
                          // Placeholder for item content
                          child: Center(
                            child: Text("Item $index"),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          height: heightCard,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(borderRadiusCard),
                            border: Border.all(
                              color: StaticColors.primary,
                              width: 1,
                            ),
                          ),
                          // Placeholder for item content
                          child: Center(
                            child: Text("Item ${index + 1}"),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            /*CustomFormPadding(
              topHeaderDistance: Values.paddingInsetButtonTop,
              childWidget: CustomElevatedButton(
                text: "SPEICHERN",
                onPressed: () {

                },
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
