/// Holds radii, font sizes, etc.
class Values {
  // rounded corners
  static const roundBorderlineRadius = 14.0;
  static const fullRoundedBox = 100.0;

  // image sizes
  static const logoImageWidthHeight = 200.0;
  static const double _logoMultiplicator = 0.25;
  static const double profileIconSize = 32.0;

  // font sizes
  static const screenTitleTextSize = 24.0;
  static const buttonTextSize = 16.0;
  static const linkTextSize = 16.0;
  static const headingTextSize = 20.0;
  static const inputTextSize = 16.0;

  // paddings
  static const paddingLogoTop = 0.0;
  static const paddingTitleTop = 40.0;
  static const paddingEdgeInset = 8.0;
  static const paddingEdgeInsetLeftRight = 42.0;
  static const paddingEdgeInsetTop = 10.0;
  static const paddingInsetButtonTop = 20.0;
  static const paddingEdgeInsetBottom = 8.0;
  static const paddingEdgeInsetBottomNoPadding = 0.0;
  static const paddingVerticalProfileScreen = 16.0;
  static const paddingHorizontalProfileScreen = 16.0;
  static const paddingHorizontalScreen = 16.0;
  static const paddingVerticalScreen = 12.0;

  static double screenWidth = 0;

  /// Returns a double representing the scaled size of the logo
  static double getScaledLogoSize() {
    return screenWidth * _logoMultiplicator;
  }

  ///Returns the screen width * 0.8 (80%)
  static double getScreenWidth() {
    return screenWidth;
  }

  /// set the width of the screen so scaling calculations can be performed
  static void setScreenWidth(double s) {
    screenWidth = s;
  }
}
