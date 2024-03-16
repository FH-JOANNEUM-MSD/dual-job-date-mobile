import 'package:dual_job_date_mobile/components/companyCard.dart';
import 'package:dual_job_date_mobile/data/mockCompanies.dart';
import 'package:dual_job_date_mobile/static_helpers/strings.dart';
import 'package:flutter/material.dart';
import '../models/company.dart';
import '../widgets/custom_toggle_button.dart';
import '../static_helpers/values.dart';

///Class representing the screen that displays Likes and Matches with companies
class LikesAndMatches extends StatefulWidget {
  const LikesAndMatches({super.key});

  @override
  State<StatefulWidget> createState() => _LikesAndMatchesState();
}

///State Class
class _LikesAndMatchesState extends State<LikesAndMatches> {
  /// This tracks to what the toggle button is set (likes or matches)
  ToggleState toggleState = ToggleState.likes;

  ///This is the Title Text that is displayed (initially: Likes)
  String titleText = LikesAndMatchesStrings.titleLikes;
  List<Company> _companyList = mockLikeCompanies;

  /// constants specific to this class (and therefore not in Values.dart)

  final double _toggleSwitchPadding =
      20; //FIXME this one might be useful in Values, align with Elisabeth


  /// Actually build the Screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Title (Top)
      appBar: AppBar(
        scrolledUnderElevation: 0,

        // Title of the Screen
        title: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Values.paddingEdgeInsetTop),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  titleText,
                  style: const TextStyle(fontSize: Values.screenTitleTextSize),
                ),
              ]),
        ),
      ),

      //Content
      body: SizedBox(
        height: MediaQuery.of(context).size.height,

        //handle user interaction with toggle button, show toggle button
        child: Column(children: [
          GestureDetector(
            onTap: () {
              toggleSwitch();
            },
            child:Padding(
              padding:  EdgeInsets.symmetric(vertical: _toggleSwitchPadding),
              child: CustomToggleButton( toggleState: toggleState),
            ) ,

          ),

          //List view of all applicable Companies
          Expanded(
            child: ListView.builder(
                itemCount: _companyList.length,
                itemBuilder: (context, idx) {
                  return CompanyCardWidget(
                    company: _companyList[idx],
                  );
                }),
          ),
         ]
        ),
      ),
    );
  }


  ///Method handling the toggling between matches and likes
  void toggleSwitch() {
    //flip the state
    toggleState = (toggleState == ToggleState.matches) ? ToggleState.likes :
                                                          ToggleState.matches;

    //Change the TitleText based on the state
    setState(() {
      if (toggleState == ToggleState.matches) {
        titleText = LikesAndMatchesStrings.titleMatches;
        _companyList = mockMatchCompanies;
      } else {
        titleText = LikesAndMatchesStrings.titleLikes;
        _companyList = mockLikeCompanies;
      }
    });
  }
}

/// Enum for toggle states
enum ToggleState { likes, matches }
