import 'package:flutter/cupertino.dart';

import '../static_helpers/values.dart';

///Class used to pad forms (like set_new_password Screen) as required by UI/UX
class CustomFormPadding extends StatelessWidget {

  final Widget? _childWidget;

  //Customizable members
  final double _topHeaderDistance;

  ///Constructor
  ///* [_childWidget]: Any widget inside the padding (Button, Text, etc...)
  /// * [topHeaderDistance]: Distance from the top header
  const CustomFormPadding({
    super.key,
    required Widget? childWidget,
    double topHeaderDistance = Values.paddingEdgeInsetTop_10,
  }) : _childWidget = childWidget, _topHeaderDistance = topHeaderDistance;

 ///Build the widget
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          Values.paddingEdgeInsetLeftRight_42,
          _topHeaderDistance,
          Values.paddingEdgeInsetLeftRight_42,
          Values.paddingEdgeInsetBottom_8),
      child:_childWidget //comes from constructor
    );
  }
}