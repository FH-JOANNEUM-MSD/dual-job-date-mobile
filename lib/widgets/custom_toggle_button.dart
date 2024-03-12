import 'package:flutter/cupertino.dart';

import '../screens/view_likes_and_matches.dart';
import '../static_helpers/colors.dart';
import '../static_helpers/strings.dart';

class CustomToggleButton extends StatelessWidget {
  const CustomToggleButton({
    super.key,
    required this.switchWidth,
    required this.switchHeight,
    required this.toggleState,
  });

  final double switchWidth;
  final double switchHeight;
  final ToggleState toggleState;

  final double _switchInsideOffsetMultiplier = 2.3;
  final int _animationDuration = 300;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: switchWidth,
      height: switchHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0), // Makes it rounded
        border: Border.all(
          color: StaticColors.primary ,

        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          AnimatedPositioned(
            duration: Duration(milliseconds: _animationDuration),
            curve: Curves.easeIn,
            left: toggleState == ToggleState.matches ? switchWidth/_switchInsideOffsetMultiplier : 0,
            right: toggleState == ToggleState.matches ? 0 : switchWidth/_switchInsideOffsetMultiplier,
            child: Container(
              height: switchHeight,
              width: switchWidth/2,
              alignment: Alignment.center,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                shape: BoxShape.rectangle,
                color: StaticColors.shadow,
                border: Border.all(
                  color: StaticColors.primary,
                )
              ),
              child: Text(
                toggleState == ToggleState.likes ? LikesAndMatchesStrings.likes : LikesAndMatchesStrings.matches,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
