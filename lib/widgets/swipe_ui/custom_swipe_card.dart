import 'dart:convert';

import 'package:dual_job_date_mobile/screens/details_company.dart';
import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:flutter/material.dart';

import '../../services/companies/company.dart';


class CustomSwipeCard extends StatefulWidget {
  const CustomSwipeCard(
      {super.key, required this.company, required this.reaction});

  final Company company;
  final bool? reaction;

  @override
  State<CustomSwipeCard> createState() => _CustomSwipeCardState();
}

class _CustomSwipeCardState extends State<CustomSwipeCard> {
  final double borderRadiusCard = 12;

  final double heightCard = 80;

  final double marginImage = 4;

  @override
  void initState() {
    super.initState();
  }

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
                builder: (context) => DetailsCompany(company: widget.company),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: marginImage,
                  horizontal: marginImage,
                ),
                width: heightCard - 2 * marginImage,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.center,
                    fit: BoxFit.contain, // Adjust the fit property here
                    image: MemoryImage(
                      base64Decode(widget.company.logoBase64!),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(widget.company.name ?? '',
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w500)),
                      Text(
                        widget.company.industry ?? '',
                        style: const TextStyle(fontSize: 14.0),
                      ),
                    ]),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  checkForOwnReaction(widget.company)
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
                          //TODO replace true and false with a switch: liked, disliked, neutral
                          child: Icon(
                              widget.reaction!
                                  ? Icons.thumb_up
                                  : Icons.thumb_down_outlined,
                              color: widget.reaction!
                                  ? StaticColors.primary
                                  : Colors.grey[500]),
                        )
                      : const SizedBox(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  bool checkForOwnReaction(Company c) {
    if (widget.reaction != null) {
      return true;
    } else {
      return false;
    }
  }

  bool checkForReaction(Company c) {
    var studentReaction = c.studentCompanies!.first;
    return studentReaction.like;
  }
}
