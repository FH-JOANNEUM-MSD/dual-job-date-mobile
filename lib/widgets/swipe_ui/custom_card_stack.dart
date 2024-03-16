import 'package:dual_job_date_mobile/widgets/swipe_ui/card_provider.dart';
import 'package:dual_job_date_mobile/widgets/swipe_ui/custom_animated_swipe_card.dart';
import 'package:dual_job_date_mobile/widgets/swipe_ui/custom_swipe_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomCardStack extends StatefulWidget {
  const CustomCardStack({super.key});

  @override
  State<CustomCardStack> createState() => _CustomCardStackState();
}

class _CustomCardStackState extends State<CustomCardStack> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CardProvider>(
      builder: (BuildContext context, CardProvider value, Widget? child) {
        final companies = value.companies;
        return Stack(
          children: companies
              .map((e) => Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: companies.last == e
                        ? CustomAnimatedSwipeCard(
                            company: e,
                          )
                        : Visibility(
                            visible: false,
                            child: CustomSwipeCard(
                              company: e,
                            )),
                  ))
              .toList(),
        );
      },
    );
  }
}
