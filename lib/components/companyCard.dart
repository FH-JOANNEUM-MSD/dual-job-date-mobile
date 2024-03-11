import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../static_helpers/colors.dart';

class CompanyCardWidget extends StatelessWidget {
  const CompanyCardWidget({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  final double borderRadiusCard = 12;
  final double heightCard = 80;
  final double marginImage = 4;

  // todo: fonts done
  // todo: dynamic text/company details added
  // todo: dynamic likes added

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusCard),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadiusCard),
        onTap: () {
          print('clicked');
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
                          vertical: marginImage,
                          horizontal: marginImage
                      ),
                      width: heightCard - 2 * marginImage,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          alignment: Alignment.center,
                          fit: BoxFit.fill,
                          image: Image.asset(imagePath).image,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 0, bottom: 0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Firma xy', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
                          Text(
                            'Softwareentwicklung',
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ]),
                  ),
                ),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 8, bottom: 2),
                    child: Text(
                      '5 likes',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
