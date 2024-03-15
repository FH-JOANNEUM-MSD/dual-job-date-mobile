import 'package:dual_job_date_mobile/static_helpers/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../screens/view_likes_and_matches.dart';
import '../static_helpers/colors.dart';
import '../static_helpers/strings.dart';

/// Class representing the toggle button in the Matches Section
class CustomToggleButton extends StatelessWidget {

  ///Constructor
  const CustomToggleButton({
    super.key,
    required this.toggleState,
  });

  // Values from the constructor
  final ToggleState toggleState;

  // Constants (only applicable in this class, so not in values.dart
  /// Defines the size of the green moving Box by dividing the parent
  /// Container width by this number.
  /// - A higher number = bigger Box
  /// - 2 would mean box is exactly half the size of the surrounding box,
  /// however 2.3 seems to fit it better
  final double _switchInsideOffsetDivisor = 2.3;

  /// Defines how opaque the green animated Box is
  /// - lower number = more transparent
  final double _animatedBoxOpacity = 0.2;

  ///Defines the duration of the sliding animation
  final int _animationDuration = 300;

  /// Defines the alignment of the text inside the slider by dividing the parent
  /// Container width by this number.
  final int _textAlignmentDivisor = 6;

  ///Define the height of the switch
  final double _switchHeight = 50;


  ///Actually build the widget
  @override
  Widget build(BuildContext context) {

    ///Define the width of the switch
    double switchWidth = Values.getScreenWidth() * 0.8;

    //Surrounding Container, green outline
    return Container(
      width: switchWidth,
      height: _switchHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Values.roundBorderlineRadius), // Makes it rounded
        border: Border.all(
          color: StaticColors.primary ,

        ),
      ),

      // The Text and the sliding Box are inside the stack
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Invisible Sized Box to be able to align everything
          SizedBox(
            height: _switchHeight,
            width: switchWidth,

            // Texts are in a row, left = likes, right = matches
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                //padded left text (likes)
                Padding(
                  //Align the text
                  padding: EdgeInsets.only(left: switchWidth / _textAlignmentDivisor),

                  //Text (Likes)
                  child: const Text(
                    LikesAndMatchesStrings.likes,
                    style: TextStyle(
                        fontSize: Values.buttonTextSize,
                        color: StaticColors.black,
                    ),
                  ),
                ),

                //padded right text (matches)
                Padding(
                  //Align the text
                  padding: EdgeInsets.only(right: switchWidth / _textAlignmentDivisor),

                  //Text (Matches)
                  child: const Text(
                    LikesAndMatchesStrings.matches,
                    style: TextStyle(
                        fontSize: Values.buttonTextSize,
                        color: StaticColors.black
                    ),
                  ),
                )
              ],
            ),

          ),

          // This is the moving green Box
          AnimatedPositioned(
            // How long it takes to move from one side to another
            duration: Duration(milliseconds: _animationDuration),
            curve: Curves.easeIn,
            //tells it where to move
            left: toggleState == ToggleState.matches ? switchWidth/_switchInsideOffsetDivisor : 0,
            right: toggleState == ToggleState.matches ? 0 : switchWidth/_switchInsideOffsetDivisor,

            //The actual Box that gets moved
            child: Container(
              //sizing and alignment of the moving box
              height: _switchHeight,
              width: switchWidth/2,
              alignment: Alignment.center,

              //Make the Box green and rounded
              decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(Values.roundBorderlineRadius),
                  shape: BoxShape.rectangle,
                  color: StaticColors.secondary.withOpacity(_animatedBoxOpacity),
                  border: Border.all(
                    color: StaticColors.primary,
                  )
              ),

            ),
          ),
        ],
      ),
    );
  }
}