import 'dart:math';
import 'package:dual_job_date_mobile/models/company.dart';
import 'package:dual_job_date_mobile/widgets/swipe_ui/card_provider.dart';
import 'package:dual_job_date_mobile/widgets/swipe_ui/custom_swipe_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CustomAnimatedSwipeCard extends StatelessWidget {
  const CustomAnimatedSwipeCard({
    super.key,
    required this.company
  });

  final Company company;

  @override
  Widget build(BuildContext context) {
    return Consumer<CardProvider>(
      builder: (BuildContext context, CardProvider value, Widget? child) {
        value.setSize(MediaQuery.of(context).size);

        var time = value.isDragging ? 0 : 400;

        return LayoutBuilder(builder: (context, constraints) {
          // extract the center point of the biggest box bounding in the
          // constraints
          final center = constraints.biggest.center(Offset.zero);

          // Calculating the angle in radians
          final angle = value.angle * (pi / 180);

          final rotatedMatrix = Matrix4.identity()
            ..translate(center.dx, center.dy)
            ..rotateZ(angle)
            ..translate(-center.dx, -center.dy);

          return GestureDetector(
            child: AnimatedContainer(
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: time),
                transform: rotatedMatrix
                  ..translate(value.position.dx, value.position.dy),
                child:  CustomSwipeCard(company: company,)),
            onPanStart: (details) {
              value.startPosition(details);
            },
            onPanUpdate: (details) {
              value.updatePosition(details);
            },
            onPanEnd: (details) {
              value.endPosition();
            },
            onTap: (){
            },
          );
        });
      },
    );
  }
}

