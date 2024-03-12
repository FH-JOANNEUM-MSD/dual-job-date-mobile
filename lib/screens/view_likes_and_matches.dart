import 'package:dual_job_date_mobile/components/companyCard.dart';
import 'package:dual_job_date_mobile/data/mockCompanies.dart';
import 'package:dual_job_date_mobile/static_helpers/strings.dart';
import 'package:dual_job_date_mobile/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

///Class representing the screen that displays Likes and Matches with companies
class LikesAndMatches extends StatefulWidget {
  const LikesAndMatches({super.key});

  @override
  State<StatefulWidget> createState() => _LikesAndMatchesState();
}

///State Class
class _LikesAndMatchesState extends State<LikesAndMatches> {
  ToggleState toggleState = ToggleState.likes;
  String titleText = "Deine Likes";



  ///Method handling the toggling between matches and likes
  void toggleSwitch() {
    //flip the state
    if (toggleState == ToggleState.matches) {
      toggleState = ToggleState.likes;
    } else {
      toggleState = ToggleState.matches;
    }

    //Change the TitleText based on the state
    setState(() {
      if (toggleState == ToggleState.matches) {
        titleText = LikesAndMatchesStrings.titleMatches;
      } else {
        titleText = LikesAndMatchesStrings.titleLikes;
      }
    });
  }

  /// Actually build the Screen
  @override
  Widget build(BuildContext context) {

    double switchWidth = MediaQuery.of(context).size.width * 0.75;
    double switchHeight = 50;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,

        // Title of the Screen
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  titleText,
                  style: const TextStyle(fontSize: 30.0),
                ),
              ]),
        ),
      ),

      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          GestureDetector(
            onTap: () {
              toggleSwitch();
            },
            child: Container(
              width: switchWidth,
              height: switchHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0), // Makes it rounded
                color: toggleState == ToggleState.likes
                    ? Colors.green
                    : Colors.red,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                    left: toggleState == ToggleState.likes ? switchWidth/2 : 0,
                    right: toggleState == ToggleState.likes ? 0 : switchWidth/2,
                    child: Container(
                      height: 50,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                      ),
                      child: Text(
                        toggleState == ToggleState.likes ? LikesAndMatchesStrings.likes : LikesAndMatchesStrings.matches,
                        style: TextStyle(
                          color: toggleState == ToggleState.likes
                              ? Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),


          //List view of all applicable Companies
          Expanded(
            child: ListView.builder(
                itemCount: mockCompanies.length,
                itemBuilder: (context, idx) {
                  return CompanyCardWidget(
                    company: mockCompanies[idx],
                  );
                }),
          ),
        ]),
      ),

      //Navigation Bar on the Bottom
      bottomNavigationBar: BottomNavBar(
        currentIndex: 3,
        onTabTapped: (index) {
          print("Navbar was tapped: $index"); //TODO: Replace with functionality
        },
      ),
    );
  }
}

//  FIXME Just for testing will be removed afterwards
void main() {
  runApp(const MaterialApp(home: LikesAndMatches()));
}

/// Enum for toggle states
enum ToggleState { likes, matches }
