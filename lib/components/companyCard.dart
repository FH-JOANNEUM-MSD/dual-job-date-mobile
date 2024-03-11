import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../static_helpers/colors.dart';

class CompanyCardWidget extends StatelessWidget {
  const CompanyCardWidget({super.key});
  final double borderRadiusCard = 12;
  final double heightCard = 80;

  // todo: fonts done
  // todo: dynamic image added
  // todo: dynamic text/company details added
  // todo: dynamic likes added

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      color: StaticColors.shadow,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusCard),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadiusCard),
        onTap: () {
          print('clicked');
        },
        child: IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    width: heightCard / 1,
                    height: heightCard,
                    // child: const FlutterLogo(size: 50.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(borderRadiusCard),
                        bottomLeft: Radius.circular(borderRadiusCard),
                      ),
                      color: Colors.white,
                      // image: DecorationImage(
                      //   fit: BoxFit.fill,
                      //   image: NetworkImage(
                      //       'https://www.w3schools.com/w3images/avatar1.png'),
                      // ),
                    ),
                  ),
                ],
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 0, bottom: 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Firma xy', style: TextStyle(fontSize: 16.0)),
                        Text(
                          'Softwareentwicklung',
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ]),
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
                      style: TextStyle(fontSize: 16.0),
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