/// Holds radii, font sizes, etc.
class Values {
  // rounded corners
  static const roundBorderlineRadius_14 = 14.0;
  static const fullRoundedBox_100 = 100.0;

  // image sizes
  static const logoImageWidthHeight_200 = 200.0;
  static const double _logoMultiplicator = 0.25;

  // font sizes
  static const screenTitleTextSize_24 = 24.0;
  static const buttonTextSize = 16.0;
  static const linkTextSize_20 = 20.0;
  static const inputTextSize_16 = 16.0;

  // paddings
  static const paddingLogoTop_50 = 50.0;
  static const paddingTitleTop_40 = 40.0;
  static const paddingEdgeInset_8 = 8.0;
  static const paddingEdgeInsetLeftRight_42 = 42.0;
  static const paddingEdgeInsetTop_10 = 10.0;
  static const paddingInsetButtonTop_20 = 20.0;
  static const paddingEdgeInsetBottom_8 = 8.0;
  static const paddingEdgeInsetBottom_0 = 0.0;

  static double _screenWidth = 0;

  /// Returns a double representing the scaled size of the logo
  static double getScaledLogoSize(){
    return _screenWidth * _logoMultiplicator;
  }

  /// set the width of the screen so scaling calculations can be performed
  static void setScreenWidth(double screenHeight){
    _screenWidth = screenHeight;
  }

}
